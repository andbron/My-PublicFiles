
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

