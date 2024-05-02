locals {

  # Environment Region Specific

  env_specific_config = jsondecode(file("${path.root}/config/${var.env_specific_config}")).input_parameters
  nsg_rules           = csvdecode(file("${path.root}/config/${var.env_specific_nsg_rules}"))
  vnet_routes         = csvdecode(file("${path.module}/config/${var.env_specific_route_rules}"))

  # Environment Global

  env_global_config = jsondecode(file("${path.root}/config/${var.env_global_config}")).input_parameters

  network_subnets = flatten([
    for vnet in local.env_specific_config.vnets : [
      for subnet in vnet.subnets : [
        {
          vnet_symbolic_name = vnet.symbolic_name
          subnet             = subnet
          nsg_rules = [for rule in local.nsg_rules : rule
            if(contains(split(",", rule.subnet), subnet.symbolic_name)) || (rule.subnet == "*")
          ]
        }
      ]
    ]
  ])

  subnet_nsg_rules = flatten([
    for sub in local.network_subnets : [
      for nsg_rule in sub.nsg_rules : {
        key = "${sub.subnet.symbolic_name}_${nsg_rule.name}"
        value = {
          subnet   = sub.subnet
          nsg_rule = nsg_rule
        }
      }
    ]
  ])

  subnet_nsg_rules_map = { for item in local.subnet_nsg_rules :
    # key/value refers to your structure in the nested for-each early
    # just cleaner and easier to understand for other people
    item.key => item.value
  }

  network_subnets_AzurePrivateEndpoint = flatten([
    for vnet in local.env_specific_config.vnets : [
      {
        vnet_symbolic_name = vnet.symbolic_name
        subnet             = "AzurePrivateEndpoint"
        nsg_rules = [for rule in local.nsg_rules : rule
        if(can(regex("^AzurePrivateEndpointSubnet_${vnet.symbolic_name}*$", (rule.subnet))))]
      }
    ]
  ])

  AzurePrivateEndpoint_nsg_rules = flatten([
    for sub in local.network_subnets_AzurePrivateEndpoint : [
      for nsg_rule in sub.nsg_rules : {
        key = "${nsg_rule.subnet}_${sub.vnet_symbolic_name}_${nsg_rule.name}"
        value = {
          subnet             = sub.subnet
          nsg_rule           = nsg_rule
          vnet_symbolic_name = sub.vnet_symbolic_name
        }
      }
    ]
  ])

  AzurePrivateEndpoint_nsg_rules_map = { for item in local.AzurePrivateEndpoint_nsg_rules :
    item.key => item.value
  }

  AzurePrivateEndpoint_vnet_list = distinct([for item in local.AzurePrivateEndpoint_nsg_rules_map : "${item.subnet}_${item.vnet_symbolic_name}"])

  route_tables = flatten([
    for vnet in local.env_specific_config.vnets : [
      for route_table in vnet.subnets : {
        route_table_subnet_assoc      = route_table.route_table_assoc == true ? route_table.symbolic_name : ""
        route_table_subnet_add_prefix = route_table.address_prefixes
      }
    ]
  ])

  route_tables_pe = flatten([
    for vnet in local.env_specific_config.vnets : {
      vnet_symbolic_name = vnet.symbolic_name
    }
  ])

  private_dns_zone = toset([
    "privatelink.blob.core.windows.net",
    "privatelink.vaultcore.azure.net",
    "privatelink.file.core.windows.net",
    "privatelink.azurewebsites.net",
    "privatelink.database.windows.net",
    "privatelink.azure-automation.net"
  ])

  dns_combo = [ # use setproduct to create all possible combinations of vnets and private dns zones
    for combo in setproduct(local.private_dns_zone, local.env_specific_config.vnets) : {
      dns_zone = combo[0]
      vnet     = combo[1]
    }
  ]

  dns_map = { for combo in local.dns_combo :
    # create map with key as vnet and dnszone. eg: "vnet1_blob"
    "${combo.vnet.symbolic_name}_${split(".", combo.dns_zone)[1]}" => combo
  }

  sub_id            = split("/", module.key_vault.id)[2]
  key_vault_role_id = format("/subscriptions/%s/providers/Microsoft.Authorization/roleDefinitions/%s", local.sub_id, local.env_global_config.kv_role_name_id) #"Key Vault Crypto Service Encryption User"

}

data "azuread_client_config" "current" {}

module "naming" {
  source       = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-naming?ref=2.0.1"
  product_area = "tcg"
  environment  = local.env_global_config.environment
  location     = local.env_specific_config.location
  domain       = local.env_global_config.app_short_name
  generator = {
    domain = {
      resource_group         = 3
      subnet                 = length(flatten(local.env_specific_config.vnets[*].subnets))
      network_watcher        = 1
      virtual_network        = length(local.env_specific_config.vnets)
      key_vault              = 3
      network_security_group = 4
      storage_account        = 3
      network_interface      = 7
      private_endpoint       = 5
      virtual_machine        = 2
      key_vault_secret       = 2
      disk_encryption_set    = 1
    }
  }
}

module "resource_group_network" {
  source              = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = "tcg-${local.env_specific_config.environment_location_id}-${local.env_global_config.app_short_name}-network-rg001"
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "resource_group_management" {
  source              = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = "tcg-${local.env_specific_config.environment_location_id}-${local.env_global_config.app_short_name}-management"
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "resource_group_1" {
  source              = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = module.naming.generated_names.domain.resource_group[0]
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "key_vault" {
  source                 = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-key-vault?ref=2.0.3"
  resource_group_id      = module.resource_group_management.id
  azurerm_key_vault_name = module.naming.generated_names.domain.key_vault[0]
  location               = module.naming.location
  tenant_id              = data.azuread_client_config.current.tenant_id
  tags                   = local.env_global_config.tags
}

data "azurerm_storage_account" "state" {
  name                = local.env_global_config.state_storage_account_name
  resource_group_name = local.env_global_config.state_storage_rg_name
}

module "rbac_assignment" {
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-role-assignment?ref=1.0.4"
  scope              = module.key_vault.id
  role_definition_id = local.key_vault_role_id
  principal_id       = "${data.azurerm_storage_account.state.identity.0.principal_id}"
}

module "key_vault_states" {
  source                 = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-key-vault?ref=2.0.3"
  resource_group_id      = module.resource_group_management.id
  azurerm_key_vault_name = module.naming.generated_names.domain.key_vault[1]
  location               = module.naming.location
  tenant_id              = data.azuread_client_config.current.tenant_id
  tags                   = local.env_global_config.tags
}
