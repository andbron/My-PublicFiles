locals {
  env_specific_config = jsondecode(file("${path.root}/config/${var.env_specific_config}")).input_parameters

  location                = local.env_specific_config.location
  environment_location_id = local.env_specific_config.environment_location_id
  primary_region          = local.env_specific_config.primary_region
  vnets                   = local.env_specific_config.vnets

  env_global_config = jsondecode(file("${path.root}/config/${var.env_global_config}")).input_parameters

  app_short_name       = local.env_global_config.app_short_name
  connectivity_sub_id  = local.env_global_config.connectivity_sub_id
  management_sub_id    = local.env_global_config.management_sub_id
  monitoring_sub_id    = local.env_global_config.monitoring_sub_id
  shared_sub_id        = local.env_global_config.shared_sub_id
  private_dns_zone_rg  = local.env_global_config.private_dns_zone_rg
  environment          = local.env_global_config.environment
  additional_providers = toset(local.env_global_config.providers)
  resource_groups      = local.env_global_config.resource_groups
  alz_tags             = local.env_global_config.tags
  rbac                 = local.env_global_config.rbac

  nsg_rules = csvdecode(file("${path.root}/config/${var.env_specific_nsg_rules}"))

  vnet_routes = csvdecode(file("${path.module}/config/${var.env_specific_route_rules}"))

  required_providers = toset([ # list of providers needed for this deployment
    "Microsoft.Storage",
    "microsoft.insights", # provider names are case sensitive
    "Microsoft.KeyVault",
    "Microsoft.Network",
    "Microsoft.Security"
  ])

  providers = setunion(local.required_providers, local.additional_providers)

  network_subnets = flatten([
    for vnet in local.vnets : [
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
    for vnet in local.vnets : [
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
    for vnet in local.vnets : [
      for route_table in vnet.subnets : {
        route_table_subnet_assoc      = route_table.route_table_assoc == true ? route_table.symbolic_name : ""
        route_table_subnet_add_prefix = route_table.address_prefixes
      }
    ]
  ])

  route_tables_pe = flatten([
    for vnet in local.vnets : {
      vnet_symbolic_name = vnet.symbolic_name
    }
  ])

  rbac_flat = flatten([
    for scope, rbacs in local.rbac : [
      for rbac in rbacs : {
        key = "${scope}_${rbac.role}"
        value = {
          scope     = scope
          role      = rbac.role
          objectIds = rbac.objectIds
        }
      } if(scope != "resource_group") && (local.primary_region ? true : scope != "subscription")
    ]
  ])

  rbac_map = { for item in local.rbac_flat :
    # key/value refers to your structure in the nested for-each early
    # just cleaner and easier to understand for other people
    item.key => item.value
  }

  rbac_flat_rg = flatten([
    for scope, rbacs in local.rbac : [
      for rbac in rbacs : {
        role      = rbac.role
        objectIds = rbac.objectIds
      } if scope == "resource_group"
    ]
  ])

  rbac_combo_rg = [ # use setproduct to create all possible combinations of resource rbac roles and resourcegroups deployed
    for combo in setproduct(local.rbac_flat_rg, range(local.resource_groups)) : {
      rbac = combo[0]
      rg   = combo[1]
    }
  ]

  rbac_map_rg = { for combo in local.rbac_combo_rg :
    # create map with key as vnet and dnszone. eg: "RG0_TCG Contributor"
    "RG${combo.rg}_${combo.rbac.role}" => combo
  }

  private_dns_zone = toset([
    "privatelink.blob.core.windows.net",
    "privatelink.vaultcore.azure.net",
    "privatelink.file.core.windows.net",
    "privatelink.azurewebsites.net",
    "privatelink.database.windows.net"
  ])

  dns_combo = [ # use setproduct to create all possible combinations of vnets and private dns zones
    for combo in setproduct(local.private_dns_zone, local.vnets) : {
      dns_zone = combo[0]
      vnet     = combo[1]
    }
  ]

  dns_map = { for combo in local.dns_combo :
    # create map with key as vnet and dnszone. eg: "vnet1_blob"
    "${combo.vnet.symbolic_name}_${split(".", combo.dns_zone)[1]}" => combo
  }
}

data "azuread_client_config" "current" {}

resource "azurerm_resource_provider_registration" "this" {
  for_each = local.primary_region ? local.providers : []
  name     = each.key
}

module "naming" {
  source       = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-naming?ref=1.0.8"
  product_area = "tcg"
  environment  = local.environment
  location     = local.location
  domain       = local.app_short_name
  generator = {
    domain = {
      resource_group         = local.resource_groups
      subnet                 = length(flatten(local.vnets[*].subnets))
      network_watcher        = 1
      ddos_protection_plan   = 1
      virtual_network        = length(local.vnets)
      key_vault              = 1
      storage_account        = 2
      network_interface      = 2
      network_security_group = length(flatten(local.vnets[*].subnets)) * 4
      private_endpoint       = 2
      route_table            = 1
    }
  }
  depends_on = [ # explicitly wait for providers to be registered before starting any deployments
    azurerm_resource_provider_registration.this
  ]
}

module "resource_group_network" {
  source              = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = "tcg-${local.environment_location_id}-${local.app_short_name}-network-rg001"
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "resource_group_management" {
  source              = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = "tcg-${local.environment_location_id}-${local.app_short_name}-management-rg001"
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "resource_group_monitoring" {
  source              = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = "tcg-${local.environment_location_id}-${local.app_short_name}-monitoring-rg001"
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "resource_group" {
  count               = local.resource_groups
  source              = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group?ref=1.0.1"
  resource_group_name = module.naming.generated_names.domain.resource_group[count.index]
  location            = module.naming.location
  tags                = local.env_global_config.tags
}

module "key_vault" {
  source                 = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-key-vault?ref=2.0.3"
  resource_group_id      = module.resource_group_management.id
  azurerm_key_vault_name = module.naming.generated_names.domain.key_vault[0]
  location               = module.naming.location
  tenant_id              = data.azuread_client_config.current.tenant_id
  tags                   = local.env_global_config.tags
  depends_on             = [module.subnet_private_endpoint]
}
