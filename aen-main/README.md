# <<App Name>>
<<Application Name>>

## Scope
Management Group: `TelstraCloudGroup/Applications`

Subscription: ``

Resource Group: ``

## Deployment
Resources `*.tf`.

## Environment

Non-Production

## Details

See [`variables.yml`](.variables.yml)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.1 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.30.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.30.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.25 |
| <a name="provider_azurerm.connectivity"></a> [azurerm.connectivity](#provider\_azurerm.connectivity) | ~>3.25 |
| <a name="provider_azurerm.monitoring"></a> [azurerm.monitoring](#provider\_azurerm.monitoring) | ~>3.25 |
| <a name="provider_azurerm.shared"></a> [azurerm.shared](#provider\_azurerm.shared) | ~>3.25 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diagnostics_log_key_vault"></a> [diagnostics\_log\_key\_vault](#module\_diagnostics\_log\_key\_vault) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_network_security_group"></a> [diagnostics\_log\_network\_security\_group](#module\_diagnostics\_log\_network\_security\_group) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_storage_account"></a> [diagnostics\_log\_storage\_account](#module\_diagnostics\_log\_storage\_account) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_storage_account_blob"></a> [diagnostics\_log\_storage\_account\_blob](#module\_diagnostics\_log\_storage\_account\_blob) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_storage_account_file"></a> [diagnostics\_log\_storage\_account\_file](#module\_diagnostics\_log\_storage\_account\_file) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_storage_account_queue"></a> [diagnostics\_log\_storage\_account\_queue](#module\_diagnostics\_log\_storage\_account\_queue) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_storage_account_table"></a> [diagnostics\_log\_storage\_account\_table](#module\_diagnostics\_log\_storage\_account\_table) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_diagnostics_log_virtual_network"></a> [diagnostics\_log\_virtual\_network](#module\_diagnostics\_log\_virtual\_network) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-diagnostic-logs | 1.0.6 |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-key-vault | 2.0.3 |
| <a name="module_naming"></a> [naming](#module\_naming) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-naming | 1.0.8 |
| <a name="module_network_security_group_association"></a> [network\_security\_group\_association](#module\_network\_security\_group\_association) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-security-group-association | 1.0.1 |
| <a name="module_network_security_group_association_private_endpoint"></a> [network\_security\_group\_association\_private\_endpoint](#module\_network\_security\_group\_association\_private\_endpoint) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-security-group-association | 1.0.1 |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-network-watcher | 1.0.1 |
| <a name="module_private_endpoint_key_vault"></a> [private\_endpoint\_key\_vault](#module\_private\_endpoint\_key\_vault) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-private-endpoint | 1.0.2 |
| <a name="module_private_endpoint_storage_account"></a> [private\_endpoint\_storage\_account](#module\_private\_endpoint\_storage\_account) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-private-endpoint | 1.0.2 |
| <a name="module_rbac_assignment"></a> [rbac\_assignment](#module\_rbac\_assignment) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-role-assignment | 1.0.3 |
| <a name="module_rbac_assignment_rg"></a> [rbac\_assignment\_rg](#module\_rbac\_assignment\_rg) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-role-assignment | 1.0.3 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group | 1.0.1 |
| <a name="module_resource_group_management"></a> [resource\_group\_management](#module\_resource\_group\_management) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group | 1.0.1 |
| <a name="module_resource_group_network"></a> [resource\_group\_network](#module\_resource\_group\_network) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-resource-group | 1.0.1 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-storage-account | 2.0.9 |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-subnet | 1.0.4 |
| <a name="module_subnet_private_endpoint"></a> [subnet\_private\_endpoint](#module\_subnet\_private\_endpoint) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-subnet | 1.0.4 |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | git::https://9025-CICD@dev.azure.com/9025-CICD/ESLZ%20Modules/_git/terraform-azurerm-virtual-network | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_provider_registration.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_provider_registration) | resource |
| [azurerm_route.vnet_routes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.vnet_routes_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_security_center_automation.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_automation) | resource |
| [azurerm_subnet_route_table_association.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network_peering.peer_from_conn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peer_to_conn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/2.30.0/docs/data-sources/client_config) | data source |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub) | data source |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_authorization_rule) | data source |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_role_definition.rbac_roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) | data source |
| [azurerm_role_definition.rbac_roles_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) | data source |
| [azurerm_storage_account.diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subscription.scope](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.connectivity_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | Set route propergation on route table | `string` | `true` | no |
| <a name="input_env_global_config"></a> [env\_global\_config](#input\_env\_global\_config) | The name of the json file that will hold the config for this environment | `string` | n/a | yes |
| <a name="input_env_specific_config"></a> [env\_specific\_config](#input\_env\_specific\_config) | The name of the json file that will hold the config for this environment | `string` | n/a | yes |
| <a name="input_env_specific_nsg_rules"></a> [env\_specific\_nsg\_rules](#input\_env\_specific\_nsg\_rules) | The name of the csv file that will hold the nsg ruleset for this environment | `string` | `""` | no |
| <a name="input_env_specific_route_rules"></a> [env\_specific\_route\_rules](#input\_env\_specific\_route\_rules) | The name of the csv file that will hold the route ruleset for this environment | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->