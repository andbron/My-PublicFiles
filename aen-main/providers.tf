terraform {
  required_version = ">=1.3.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.80"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#skip_provider_registration
  storage_use_azuread        = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#skip_provider_registration
  storage_use_azuread        = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread
  alias                      = "connectivity"
  subscription_id            = local.env_global_config.connectivity_sub_id
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#skip_provider_registration
  storage_use_azuread        = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread
  alias                      = "management"
  subscription_id            = local.env_global_config.management_sub_id
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#skip_provider_registration
  storage_use_azuread        = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread
  alias                      = "shared"
  subscription_id            = local.env_global_config.shared_sub_id
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#skip_provider_registration
  storage_use_azuread        = true # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread
  alias                      = "monitoring"
  subscription_id            = local.env_global_config.monitoring_sub_id
}
