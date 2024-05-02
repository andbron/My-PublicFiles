data "azurerm_eventhub" "this" {
  count               = local.primary_region ? 1 : 0
  provider            = azurerm.monitoring
  name                = "tcg-${local.environment_location_id}-pbmn-evh001"
  resource_group_name = "tcg-${local.environment_location_id}-pbmn-rg-eventhub"
  namespace_name      = "tcg${local.environment_location_id}pbmnevhns001"
}

data "azurerm_eventhub_authorization_rule" "this" {
  count               = local.primary_region ? 1 : 0
  provider            = azurerm.monitoring
  name                = "tcg-${local.environment_location_id}-pbmn-evh001-key"
  namespace_name      = "tcg${local.environment_location_id}pbmnevhns001"
  eventhub_name       = "tcg-${local.environment_location_id}-pbmn-evh001"
  resource_group_name = "tcg-${local.environment_location_id}-pbmn-rg-eventhub"
}

# Enable Microsoft Defender security alerts to stream into Eventhub
resource "azurerm_security_center_automation" "this" {
  count               = local.primary_region ? 1 : 0
  name                = "tcg-${module.naming.env_abbr}-${local.app_short_name}-mdc-logs001"
  location            = module.naming.location
  resource_group_name = module.resource_group_management.name

  action {
    type              = "eventhub"
    resource_id       = data.azurerm_eventhub.this[0].id
    connection_string = data.azurerm_eventhub_authorization_rule.this[0].primary_connection_string
  }

  source {
    event_source = "Alerts"
    rule_set {
      rule {
        property_path  = "properties.metadata.severity"
        operator       = "Equals"
        expected_value = "High"
        property_type  = "String"
      }
      rule {
        property_path  = "properties.metadata.severity"
        operator       = "Equals"
        expected_value = "Medium"
        property_type  = "String"
      }
      rule {
        property_path  = "properties.metadata.severity"
        operator       = "Equals"
        expected_value = "Low"
        property_type  = "String"
      }
    }
  }
  scopes = [data.azurerm_subscription.scope.id]
}
