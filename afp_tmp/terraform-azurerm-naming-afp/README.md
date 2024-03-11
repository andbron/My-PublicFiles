# Module README

<!-- BEGIN_TF_DOCS -->



# CHANGELOG

## 1.0.0 04/03/24

- initial module creation

## 1.0.1 05/03/24

- test tag creation

## 1.0.2 10/03/24

- add outputs to test

---

**_CHANGELOG Notes_**

- _Add new changelog entries to the top of the file_
- _Document changes to module inputs (vars) and outputs_
- _Highlight breaking changes using the notation:_ **[BREAKING CHANGE]**
  

## Service Design
When a new module is required for use, a Bootstrap process exists to create the underlying repository that the module will be developed in.

The below steps detail the process and standards to follow when creating a repository in the Modules project space.

Get the Clone URL for the ec.templates repository.

(https://<ado-org-name>@dev.azure.com/<ado-org-name>/<ado-modules-project>/\_git/<ado-repo-name>)

Use this URL to Clone the Bootstrap module locally in VS Code (or your editor of choice).

In order to execute the Bootstrap.ps1 file, you will need the following pieces of information;

**Personal Access Token (PAT)**: Manually Generated via your Azure DevOps instance.

**Module Name**: This should follow the format "terraform_modulename". for example for a policy assignment module "terraform_policy_assignment".

**Local Modules Directory:** This is just a local folder structure in your environment that will be used to stage files before uploading them to the DevOps instance.

**Setting the PAT Token as an Environment Variable**
Once you have the PAT token you need to set it in the execution context of the script. This is done via running $ENV:AZURE_DEVOPS_EXT_PAT = "<PATTOKENHERE>"

To execute and build the repo for use, the following command should be executed in the Terminal of your VS Code instance (substituting values for your own).

.\bootstrap.ps1 -moduleName "terraform_policy_assignment" -localModulesDirectory "C:\repos"

This should then successfully provision the desired repo in order to develop and publish for use.
  

## Example usage

```hcl

### A provider block is required in order to interact with an azure subscription
### Note: the Unit testing pipeline handles the necessary authentication steps 
terraform {
  required_version = ">= 1.7.2" # Terraform Version >=1.7.2
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}


# ### This code snippet will call the module that this test is designed for using a relative path
module "thismodule" {
  source = "../../"
  #add module inputs as needed
  product_area = "alz"
  environment  = "non_production"
  location     = "australiasoutheast"
  domain       = "pltz"
  generator = {
    domain = {
      resource_group         = 3
      subnet                 = 4
      network_watcher        = 1
      virtual_network        = 5
      key_vault              = 10
      storage_account        = 4
      network_interface      = 5
      network_security_group = 4
      private_endpoint       = 5
      route_table            = 5
      azure_compute_gallery  = 1
      private_dns_resolver   = 1
    }
  }

}

output "resource_group_names_returned" {
  value = module.thismodule.generated_names.domain.resource_group

}

  
{
    "plan": true,
    "apply": true,
    "destroy": true
}
 
module "tf_example" {
  source = "git::https://dev.azure.com/<ado_org>/<tf_modules_project>/_git/tf_example?ref=1.0.0"

  rg_name  = "rg-name"  #required
  location = "location" #required

}
   
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.25 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | ~>3.4 |  

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_abbreviation"></a> [custom\_abbreviation](#input\_custom\_abbreviation) | To be used as custom abbreviation for custom services. | `string` | `"abcde"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | To be used as unique identifier for platform landing zones or application landing zones. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_environment_map"></a> [environment\_map](#input\_environment\_map) | n/a | `map(any)` | <pre>{<br>  "development": "dv",<br>  "development_integration": "di",<br>  "non_production": "np",<br>  "performance_testing": "pt",<br>  "production": "pd",<br>  "quality_assurance": "qa",<br>  "sandbox": "sb",<br>  "user_acceptance_testing": "ut"<br>}</pre> | no |
| <a name="input_generator"></a> [generator](#input\_generator) | n/a | `map(map(number))` | <pre>{<br>  "app": {<br>    "rg": 1<br>  }<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | general | `string` | n/a | yes |
| <a name="input_location_map"></a> [location\_map](#input\_location\_map) | n/a | `map(any)` | <pre>{<br>  "australiacentral": "ac",<br>  "australiacentral2": "ac2",<br>  "australiaeast": "ae",<br>  "australiasoutheast": "ase",<br>  "brazilsouth": "brs",<br>  "canadacentral": "cac",<br>  "canadaeast": "cae",<br>  "centralindia": "ic",<br>  "centralus": "uc",<br>  "chinaeast": "ce",<br>  "chinaeast2": "ce2",<br>  "chinanorth": "cn",<br>  "chinanorth2": "cn2",<br>  "eastasia": "ae",<br>  "eastus": "ue",<br>  "eastus2": "ue2",<br>  "francecentral": "fc",<br>  "francesouth": "fs",<br>  "germanycentral": "gc",<br>  "germanynorth": "gn",<br>  "germanynortheast": "gne",<br>  "germanywestcentral": "gwc",<br>  "global": "gl",<br>  "japaneast": "je",<br>  "japanwest": "jw",<br>  "koreacentral": "kc",<br>  "koreasouth": "ks",<br>  "northcentralus": "unc",<br>  "northeurope": "en",<br>  "norwayeast": "ne",<br>  "norwaywest": "nw",<br>  "notapplicable": "",<br>  "southafricanorth": "san",<br>  "southafricawest": "saw",<br>  "southcentralus": "usc",<br>  "southeastasia": "ase",<br>  "southindia": "is",<br>  "switzerlandnorth": "swn",<br>  "switzerlandwest": "sww",<br>  "uaecentral": "uac",<br>  "uaenorth": "uan",<br>  "uksouth": "uks",<br>  "ukwest": "ukw",<br>  "usdodcentral": "ucd",<br>  "usdodeast": "ued",<br>  "usgovarizona": "uag",<br>  "usgoviowa": "uig",<br>  "usgovtexas": "utg",<br>  "usgovvirginia": "uvg",<br>  "westcentralus": "us",<br>  "westeurope": "ew",<br>  "westindia": "iw",<br>  "westus": "uw",<br>  "westus2": "us",<br>  "worldwide": "ww-"<br>}</pre> | no |
| <a name="input_product_area"></a> [product\_area](#input\_product\_area) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_affix"></a> [affix](#output\_affix) | Affix name. |
| <a name="output_env_abbr"></a> [env\_abbr](#output\_env\_abbr) | Abbreviated environment name. |
| <a name="output_environment"></a> [environment](#output\_environment) | Environment name. |
| <a name="output_generated_names"></a> [generated\_names](#output\_generated\_names) | Generated names. |
| <a name="output_location"></a> [location](#output\_location) | Location |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | Prefix name. |
| <a name="output_tags"></a> [tags](#output\_tags) | tags. |


<!-- END_TF_DOCS -->