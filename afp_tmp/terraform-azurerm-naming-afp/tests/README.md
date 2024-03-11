# Terraform Module Testing

## Process Overview

Modules that have been created from the latest bootstrap code (or those that have been retrofitted) will execute unit tests using the following process:

**pipeline** - in order to execute unit testing, the module pipeline must call the pipeline template job_tf_unit_testing.yml.

_On Commit to feature branch (CI Trigger)_ - By default, no testing will be executed.

_Manual pipeline execution on any branch_, _PR Build Validation_ - Unit testing will be executed.

**tests folder** - The Unit Testing process looks in the root of the module repo for a folder named **tests**. This folder can contain multiple tests that are automatically detected and executed in sequence. Currently, tests are self contained - each test is executed independently and does not affect other tests. Each test is contained within a subfolder using any name (except "sample") - eg. **tests/basic**, **tests/complex**. A suggested approach would be to have one test that execute the module with only the minimum required parameters, and one the executes the module with all optional parameters.

**run.ps1** - Each test must contain a script run.ps1 - this script contains all of the logic for conducting the unit test. The bootstrap example script performs a terraform init, plan, apply, and destroy. It will error is any step fails. This logic can be updated to suit the specific needs of the module.

**main.tf** - The bootstrap example also includes a terraform file to be executed during the test. This file must include a terraform block, a provider block, and resource/module blocks to set up any prerequisites for the module test. For example if the module being tested in for Azure Firewall, it expects a prerequisite vnet to be created before the module. Finally, the module is called using a relative path determined from the test folder.

```hcl
### A provider block is required in order to interact with an azure subscription
### Note: the Unit testing pipeline handles the necessary authentication steps
terraform {
    required_version = "~> 1.0.0" # Terraform Version
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 2.72.0"
        }
    }
}

provider "azurerm" {
  features {}
}

### Create any test dependencies by calling other modules, or creating resources directly
resource "azurerm_resource_group" "example" {
 name     = "UnitTestExample1"
 location = "Australia East"
}

### Call the module for testing
module "thismodule" {
  source                   = "../../"
  #add module inputs as needed
  key_vault_name = "test-akv-001"
  resource_group_name = "UnitTestExample1"

  depends_on = [
    azurerm_resource_group.example
  ]
}
```

NOTE: The unit testing pipeline automatically handles provider authentication. TODO: The service principal in use will soon be restricted to a specific test only subscription.

## Running Tests Locally

It should also be possible to run the unit tests locally. Just authenticate Azure CLI, move into the test directory and execute run.ps1.

## Future enhancments

- This unit testing process has been created to enable maximum flexibility, which will allow experimentation with different testing approaches. This process could be locked down and standardised in future if desired.

- Tests are very simple deployment tests. A more capable testing framework (eg Pester) could be added to perform more rigorous testing against the resources deployed by the module.
