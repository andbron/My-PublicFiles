data "azurerm_subscription" "scope" {}

# RBAC for Platform managed RGs
data "azurerm_role_definition" "rbac_roles" {
  for_each = length(local.rbac_map) == 0 ? {} : local.rbac_map
  name     = each.value.role
  scope    = each.value.scope == "subscription" ? data.azurerm_subscription.scope.id : each.value.scope == "network_resource_group" ? module.resource_group_network.id : each.value.scope == "management_resource_group" ? module.resource_group_management.id : each.value.scope == "monitoring_resource_group" ? module.resource_group_monitoring.id : null
}

module "rbac_assignment" {
  for_each           = length(local.rbac_map) == 0 ? {} : local.rbac_map
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-role-assignment?ref=1.0.3"
  scope              = each.value.scope == "subscription" ? data.azurerm_subscription.scope.id : each.value.scope == "network_resource_group" ? module.resource_group_network.id : each.value.scope == "management_resource_group" ? module.resource_group_management.id : each.value.scope == "monitoring_resource_group" ? module.resource_group_monitoring.id : null
  role_definition_id = data.azurerm_role_definition.rbac_roles[each.key].role_definition_id
  principal_id       = each.value.objectIds
}

# RBAC for Application RGs
data "azurerm_role_definition" "rbac_roles_rg" {
  for_each = length(local.rbac_map_rg) == 0 ? {} : local.rbac_map_rg
  name     = each.value.rbac.role
  scope    = module.resource_group[each.value.rg].id
}

module "rbac_assignment_rg" {
  for_each           = length(local.rbac_map_rg) == 0 ? {} : local.rbac_map_rg
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-role-assignment?ref=1.0.3"
  scope              = module.resource_group[each.value.rg].id
  role_definition_id = data.azurerm_role_definition.rbac_roles_rg[each.key].role_definition_id
  principal_id       = each.value.rbac.objectIds
}
