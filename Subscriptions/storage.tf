locals {
  storage_purge_after_days = 2555 # 7 years
}

module "storage_account" {
  source              = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-storage-account?ref=2.0.12"
  resource_group_name = module.resource_group_management.name
  name                = module.naming.generated_names.domain.storage_account[0]
  location            = module.naming.location
  key_vault_id        = module.key_vault.id
  depends_on          = [module.key_vault] # added this explicit dependency since TF didn't wait until ip_rules were applied.
  tags                = local.env_global_config.tags
  cors_rule_enabled   = true
  allowed_origins     = ["https://tcg${local.env_specific_config.environment_location_id}${local.env_global_config.app_short_name}sa001.blob.core.windows.net/"]
  allowed_headers     = ["*"] #TODO : Identify allowed Headers and provide value
  exposed_headers     = ["*"] #TODO : Identify exposed Headers and provide value
  max_age_in_seconds  = 3600
}

# Adding Lifecycle management for central storage account
# delete blob, snapshot, version if not modified since 2 years (730 days)
resource "azurerm_storage_management_policy" "this" {
  storage_account_id = module.storage_account.id
  rule {
    name    = "default-purge-rule"
    enabled = true
    filters {
      blob_types = ["blockBlob", "appendBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = local.storage_purge_after_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = local.storage_purge_after_days
      }
      version {
        delete_after_days_since_creation = local.storage_purge_after_days
      }
    }
  }
}

module "storage_account_states" {
  source              = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-storage-account?ref=2.0.12"
  resource_group_name = module.resource_group_management.name
  name                = module.naming.generated_names.domain.storage_account[1]
  location            = module.naming.location
  key_vault_id        = module.key_vault_states.id
  depends_on          = [module.key_vault_states]
  tags                = local.env_global_config.tags
  cors_rule_enabled   = true
  allowed_origins     = ["https://tcgnpaemgmtsa002.blob.core.windows.net/"]
  allowed_headers    = ["*"] #TODO : Identify allowed Headers and provide value
  exposed_headers    = ["*"] #TODO : Identify exposed Headers and provide value
  max_age_in_seconds  = 3600
}
