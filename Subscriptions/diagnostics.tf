data "azurerm_storage_account" "diagnostics" {
  provider            = azurerm.monitoring
  name                = "tcg${local.env_specific_config.environment_location_id}pbmnsa001"
  resource_group_name = "tcg-${local.env_specific_config.environment_location_id}-pbmn-rg-storage-diag"
}

module "diagnostics_log_key_vault" {
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.key_vault[0]}-diagnosticslogs-001"
  target_resource_id = module.key_vault.id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_key_vault_states" {
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.key_vault[1]}-diagnosticslogs-001"
  target_resource_id = module.key_vault_states.id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_virtual_network" {
  for_each           = { for vnet in local.env_specific_config.vnets : vnet.symbolic_name => vnet }
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.virtual_network[index(local.env_specific_config.vnets, each.value)]}-diagnosticslogs-001"
  target_resource_id = module.virtual_network[each.key].id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_network_security_group" {
  for_each           = { for sub in local.network_subnets : sub.subnet.address_prefixes => sub }
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.network_security_group[0]}-diagnosticslogs-001"
  target_resource_id = azurerm_network_security_group.this[each.key].id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account" {
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[0]}-diagnosticslogs-001"
  target_resource_id = module.storage_account.id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_blob" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[0]}-blob-diagnosticslogs-001"
  target_resource_id = "${module.storage_account.id}/blobServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_file" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[0]}-file-diagnosticslogs-001"
  target_resource_id = "${module.storage_account.id}/fileServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_table" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[0]}-table-diagnosticslogs-001"
  target_resource_id = "${module.storage_account.id}/tableServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_queue" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[0]}-queue-diagnosticslogs-001"
  target_resource_id = "${module.storage_account.id}/queueServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}


module "diagnostics_log_storage_account_states" {
  source             = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[1]}-diagnosticslogs-001"
  target_resource_id = module.storage_account_states.id
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_states_blob" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[1]}-blob-diagnosticslogs-001"
  target_resource_id = "${module.storage_account_states.id}/blobServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_states_file" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[1]}-file-diagnosticslogs-001"
  target_resource_id = "${module.storage_account_states.id}/fileServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_states_table" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[1]}-table-diagnosticslogs-001"
  target_resource_id = "${module.storage_account_states.id}/tableServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}

module "diagnostics_log_storage_account_states_queue" {
  source             = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs?ref=1.0.7"
  name               = "${module.naming.generated_names.domain.storage_account[1]}-queue-diagnosticslogs-001"
  target_resource_id = "${module.storage_account_states.id}/queueServices/default"
  storage_account_id = data.azurerm_storage_account.diagnostics.id
}
