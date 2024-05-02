module "storage_account" {
  source              = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-storage-account?ref=2.0.14"
  resource_group_name = module.resource_group_management.name
  name                = module.naming.generated_names.domain.storage_account[0]
  location            = module.naming.location
  key_vault_id        = module.key_vault.id
  tags                = local.env_global_config.tags
  max_age_in_seconds  = 3600
}

module "storage_account_monitoring" {
  source                    = "git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-storage-account?ref=2.0.14"
  resource_group_name       = module.resource_group_monitoring.name
  name                      = module.naming.generated_names.domain.storage_account[1]
  location                  = module.naming.location
  key_vault_id              = module.key_vault.id
  tags                      = local.env_global_config.tags
  shared_access_key_enabled = true
  splunk_network_access     = true
  max_age_in_seconds        = 3600
}

resource "azurerm_storage_container" "this" {
  name                  = "states"
  storage_account_name  = module.storage_account.name
  container_access_type = "private"
}
