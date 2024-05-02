module "service_health_alert" {
  source                  = "git::https://dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-monitor-activity-log-alert?ref=1.0.4"
  alert_name              = "ServiceHeathAlert"
  alert_scope_list        = local.env_global_config.servicehealthalertscope
  alert_category          = "ServiceHealth"
  resource_group_name     = module.resource_group_management.name
  action_group_name       = "AzureTelstraCloudPlatform"
  action_group_short_name = "ATCP"
  emailreceivers          = local.env_global_config.service_health_email_receiver
  tags                    = local.env_global_config.tags
}
