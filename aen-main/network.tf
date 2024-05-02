module "network_watcher" {
  source               = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-watcher?ref=1.0.1"
  network_watcher_name = module.naming.generated_names.domain.network_watcher[0]
  resource_group_name  = module.resource_group_network.name
  location             = module.naming.location
  tags                 = local.env_global_config.tags
}

module "virtual_network" {
  for_each             = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  source               = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-virtual-network?ref=1.0.1"
  resource_group_name  = module.resource_group_network.name
  virtual_network_name = module.naming.generated_names.domain.virtual_network[index(local.env_specific_config.vnets, each.value)]
  address_space        = each.value.address_space
  dns_servers          = each.value.dns_servers
  location             = module.naming.location
  tags                 = local.env_global_config.tags
}

module "subnet" {
  for_each                    = { for sub in local.network_subnets : sub.subnet.address_prefixes => sub }
  source                      = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-subnet?ref=1.0.4"
  resource_group_name         = module.resource_group_network.name
  subnet_name                 = module.naming.generated_names.domain.subnet[index(local.network_subnets, each.value)]
  virtual_network_name        = module.virtual_network[each.value.vnet_symbolic_name].name
  address_prefixes            = each.value.subnet.address_prefixes
  delegation_name             = each.value.subnet.delegation.delegation_name == "" ? null : each.value.subnet.delegation.delegation_name
  service_delegation_name     = each.value.subnet.delegation.service_delegation_name == "" ? null : each.value.subnet.delegation.service_delegation_name
  service_delegation_actions  = each.value.subnet.delegation.service_delegation_actions == [] ? null : each.value.subnet.delegation.service_delegation_actions
  service_endpoints           = each.value.subnet.service_endpoints == [] ? null : each.value.subnet.service_endpoints
  service_endpoint_policy_ids = each.value.subnet.service_endpoint_policy_ids == [] ? null : each.value.subnet.service_endpoint_policy_ids
}

module "subnet_private_endpoint" {
  for_each                                  = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  source                                    = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-subnet?ref=1.0.4"
  resource_group_name                       = module.resource_group_network.name
  subnet_name                               = "AzurePrivateEndpoint"
  virtual_network_name                      = module.virtual_network[each.key].name
  address_prefixes                          = each.value.address_prefixes_private_endpoint
  private_endpoint_network_policies_enabled = true
}

resource "azurerm_network_security_group" "this" {
  for_each            = { for sub in local.network_subnets : sub.subnet.address_prefixes => sub }
  name                = module.naming.generated_names.domain.network_security_group[index(local.network_subnets, each.value)]
  location            = module.naming.location
  resource_group_name = module.resource_group_network.name
  tags                = local.env_global_config.tags

  lifecycle {
    ignore_changes = [
      security_rule
    ]
  }
}

resource "azurerm_network_security_group" "private_endpoint" {
  for_each            = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  name                = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-${local.env_global_config.app_short_name}-nsg000-pe-${each.key}"
  location            = module.naming.location
  resource_group_name = module.resource_group_network.name
  tags                = local.env_global_config.tags

  lifecycle {
    ignore_changes = [
      security_rule
    ]
  }
}

resource "azurerm_network_security_rule" "this" {
  for_each                                   = local.subnet_nsg_rules_map
  name                                       = each.value.nsg_rule.name
  description                                = each.value.nsg_rule.description
  protocol                                   = each.value.nsg_rule.protocol
  direction                                  = each.value.nsg_rule.direction
  access                                     = each.value.nsg_rule.access
  priority                                   = each.value.nsg_rule.priority
  source_address_prefix                      = each.value.nsg_rule.source_address_prefix != "" ? each.value.nsg_rule.source_address_prefix : null
  source_address_prefixes                    = each.value.nsg_rule.source_address_prefixes != "" ? split(",", each.value.nsg_rule.source_address_prefixes) : null
  destination_address_prefix                 = each.value.nsg_rule.destination_address_prefix != "" ? each.value.nsg_rule.destination_address_prefix : null
  destination_address_prefixes               = each.value.nsg_rule.destination_address_prefixes != "" ? split(",", each.value.nsg_rule.destination_address_prefixes) : null
  source_port_range                          = each.value.nsg_rule.source_port_range != "" ? each.value.nsg_rule.source_port_range : null
  source_port_ranges                         = each.value.nsg_rule.source_port_ranges != "" ? split(",", each.value.nsg_rule.source_port_ranges) : null
  destination_port_range                     = each.value.nsg_rule.destination_port_range != "" ? each.value.nsg_rule.destination_port_range : null
  destination_port_ranges                    = each.value.nsg_rule.destination_port_ranges != "" ? split(",", each.value.nsg_rule.destination_port_ranges) : null
  source_application_security_group_ids      = each.value.nsg_rule.source_application_security_group_ids != "" ? split(",", each.value.nsg_rule.source_application_security_group_ids) : null
  destination_application_security_group_ids = each.value.nsg_rule.destination_application_security_group_ids != "" ? split(",", each.value.nsg_rule.destination_application_security_group_ids) : null
  resource_group_name                        = module.resource_group_network.name
  network_security_group_name                = azurerm_network_security_group.this[each.value.subnet.address_prefixes].name
}

resource "azurerm_network_security_rule" "private_endpoint" {
  for_each                                   = local.AzurePrivateEndpoint_nsg_rules_map
  name                                       = each.value.nsg_rule.name
  description                                = each.value.nsg_rule.description
  protocol                                   = each.value.nsg_rule.protocol
  direction                                  = each.value.nsg_rule.direction
  access                                     = each.value.nsg_rule.access
  priority                                   = each.value.nsg_rule.priority
  source_address_prefix                      = each.value.nsg_rule.source_address_prefix != "" ? each.value.nsg_rule.source_address_prefix : null
  source_address_prefixes                    = each.value.nsg_rule.source_address_prefixes != "" ? split(",", each.value.nsg_rule.source_address_prefixes) : null
  destination_address_prefix                 = each.value.nsg_rule.destination_address_prefix != "" ? each.value.nsg_rule.destination_address_prefix : null
  destination_address_prefixes               = each.value.nsg_rule.destination_address_prefixes != "" ? split(",", each.value.nsg_rule.destination_address_prefixes) : null
  source_port_range                          = each.value.nsg_rule.source_port_range != "" ? each.value.nsg_rule.source_port_range : null
  source_port_ranges                         = each.value.nsg_rule.source_port_ranges != "" ? split(",", each.value.nsg_rule.source_port_ranges) : null
  destination_port_range                     = each.value.nsg_rule.destination_port_range != "" ? each.value.nsg_rule.destination_port_range : null
  destination_port_ranges                    = each.value.nsg_rule.destination_port_ranges != "" ? split(",", each.value.nsg_rule.destination_port_ranges) : null
  source_application_security_group_ids      = each.value.nsg_rule.source_application_security_group_ids != "" ? split(",", each.value.nsg_rule.source_application_security_group_ids) : null
  destination_application_security_group_ids = each.value.nsg_rule.destination_application_security_group_ids != "" ? split(",", each.value.nsg_rule.destination_application_security_group_ids) : null
  resource_group_name                        = module.resource_group_network.name
  network_security_group_name                = azurerm_network_security_group.private_endpoint[each.value.vnet_symbolic_name].name
}

module "network_security_group_association" {
  for_each                  = { for sub in local.network_subnets : sub.subnet.address_prefixes => sub }
  source                    = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-security-group-association?ref=1.0.1"
  subnet_id                 = module.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}

module "network_security_group_association_private_endpoint" {
  count                     = length(local.AzurePrivateEndpoint_vnet_list)
  source                    = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-security-group-association?ref=1.0.1"
  subnet_id                 = module.subnet_private_endpoint[split("_", local.AzurePrivateEndpoint_vnet_list[count.index])[1]].id
  network_security_group_id = azurerm_network_security_group.private_endpoint[split("_", local.AzurePrivateEndpoint_vnet_list[count.index])[1]].id
}

# Peering

resource "azurerm_virtual_network_peering" "peer_to_conn" {
  for_each                  = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  name                      = "${module.naming.generated_names.domain.virtual_network[index(local.env_specific_config.vnets, each.value)]}-to-conn"
  resource_group_name       = module.resource_group_network.name
  virtual_network_name      = module.virtual_network[each.key].name
  remote_virtual_network_id = data.azurerm_virtual_network.connectivity_hub.id
  allow_forwarded_traffic   = true
  use_remote_gateways       = true
}

resource "azurerm_virtual_network_peering" "peer_from_conn" {
  for_each                  = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  provider                  = azurerm.connectivity
  name                      = "conn-to-${module.naming.generated_names.domain.virtual_network[index(local.env_specific_config.vnets, each.value)]}"
  resource_group_name       = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-conn-network-rg001"
  virtual_network_name      = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-conn-vnet001"
  remote_virtual_network_id = module.virtual_network[each.key].id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = true
}

# Private DNS Zones

data "azurerm_virtual_network" "connectivity_hub" {
  provider            = azurerm.connectivity
  name                = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-conn-vnet001"
  resource_group_name = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-conn-network-rg001"
}

data "azurerm_private_dns_zone" "dns_zone" {
  for_each            = local.private_dns_zone
  provider            = azurerm.shared
  name                = each.key
  resource_group_name = local.env_global_config.private_dns_zone_rg
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  for_each              = local.dns_map
  provider              = azurerm.shared
  name                  = "${module.virtual_network[each.value.vnet.symbolic_name].name}-${split(".", each.value.dns_zone)[1]}"
  resource_group_name   = data.azurerm_private_dns_zone.dns_zone[each.value.dns_zone].resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.dns_zone[each.value.dns_zone].name
  virtual_network_id    = module.virtual_network[each.value.vnet.symbolic_name].id
  tags                  = local.env_global_config.tags
}

# Private Endpoints

module "private_endpoint_key_vault" {
  source                         = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-private-endpoint?ref=1.0.2"
  location                       = module.naming.location
  resource_group_name            = module.resource_group_management.name
  privateendpoint_name           = module.naming.generated_names.domain.private_endpoint[0]
  subnet_id                      = module.subnet_private_endpoint[local.env_specific_config.vnets[0].symbolic_name].id
  custom_network_interface_name  = module.naming.generated_names.domain.network_interface[0]
  private_dns_zone_group_name    = "null"
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.dns_zone["privatelink.vaultcore.azure.net"].id]
  private_connection_resource_id = module.key_vault.id
  subresource_names              = ["vault"]
  tags                           = local.env_global_config.tags
}

module "private_endpoint_storage_account" {
  source                         = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-private-endpoint?ref=1.0.2"
  location                       = module.naming.location
  resource_group_name            = module.resource_group_management.name
  privateendpoint_name           = module.naming.generated_names.domain.private_endpoint[1]
  subnet_id                      = module.subnet_private_endpoint[local.env_specific_config.vnets[0].symbolic_name].id
  custom_network_interface_name  = module.naming.generated_names.domain.network_interface[1]
  private_dns_zone_group_name    = "null"
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.dns_zone["privatelink.blob.core.windows.net"].id]
  private_connection_resource_id = module.storage_account.id
  subresource_names              = ["blob"]
  tags                           = local.env_global_config.tags
}

module "private_endpoint_storage_account_monitoring" {
  source                         = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-private-endpoint?ref=1.0.2"
  location                       = module.naming.location
  resource_group_name            = module.resource_group_monitoring.name
  privateendpoint_name           = module.naming.generated_names.domain.private_endpoint[2]
  subnet_id                      = module.subnet_private_endpoint[local.env_specific_config.vnets[0].symbolic_name].id
  custom_network_interface_name  = module.naming.generated_names.domain.network_interface[2]
  private_dns_zone_group_name    = "null"
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.dns_zone["privatelink.blob.core.windows.net"].id]
  private_connection_resource_id = module.storage_account_monitoring.id
  subresource_names              = ["blob"]
  tags                           = local.env_global_config.tags
}

# Route table

resource "azurerm_route_table" "this" {
  for_each                      = { for routes in local.route_tables : routes.route_table_subnet_assoc => routes if routes.route_table_subnet_assoc != "" }
  name                          = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-${local.env_global_config.app_short_name}-${replace(each.key, "subnet", "rt00")}"
  location                      = module.naming.location
  resource_group_name           = module.resource_group_network.name
  disable_bgp_route_propagation = coalesce(var.disable_bgp_route_propagation, null)
  tags                          = local.env_global_config.tags
}

resource "azurerm_route" "vnet_routes" {
  for_each               = { for rules in local.vnet_routes : "${rules.route_table_assoc}_${rules.route_name}" => rules if !startswith(rules.route_table_assoc, "AzurePrivateEndpointSubnet") }
  name                   = each.value.route_name
  resource_group_name    = module.resource_group_network.name
  route_table_name       = azurerm_route_table.this[each.value.route_table_assoc].name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = (each.value.next_hop_type == "VirtualAppliance") == true ? each.value.route_next_hop_in_ip_address : null
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each       = { for routes in local.route_tables : routes.route_table_subnet_assoc => routes if routes.route_table_subnet_assoc != "" }
  subnet_id      = module.subnet[each.value.route_table_subnet_add_prefix].id
  route_table_id = azurerm_route_table.this[each.key].id
}

resource "azurerm_route_table" "private_endpoint" {
  for_each                      = { for pe in local.route_tables_pe : pe.vnet_symbolic_name => pe } #route_tables_pe
  name                          = "${local.env_global_config.auth_type}-${local.env_specific_config.environment_location_id}-${local.env_global_config.app_short_name}-rt000-pe-${each.key}"
  location                      = module.naming.location
  resource_group_name           = module.resource_group_network.name
  disable_bgp_route_propagation = coalesce(var.disable_bgp_route_propagation, null)
  tags                          = local.env_global_config.tags
}

resource "azurerm_route" "vnet_routes_private_endpoint" {
  for_each               = { for rules in local.vnet_routes : "${rules.route_table_assoc}_${rules.route_name}" => rules if startswith(rules.route_table_assoc, "AzurePrivateEndpointSubnet") }
  name                   = each.value.route_name
  resource_group_name    = module.resource_group_network.name
  route_table_name       = azurerm_route_table.private_endpoint[split("_", each.key)[1]].name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = (each.value.next_hop_type == "VirtualAppliance") == true ? each.value.route_next_hop_in_ip_address : null
}

resource "azurerm_subnet_route_table_association" "private_endpoint" {
  for_each       = { for pe in local.route_tables_pe : pe.vnet_symbolic_name => pe }
  subnet_id      = module.subnet_private_endpoint[each.value.vnet_symbolic_name].id
  route_table_id = azurerm_route_table.private_endpoint[each.key].id
}
