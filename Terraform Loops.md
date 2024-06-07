# Terraform For Loop - Expression Overview with Examples

[_TOC_]

**Different data structures to consider include:**
- Set (List)
- Map
- Map of Objects




Within the resource configuration block, HashiCorp Terraform iterates over the collection provided to `for_each`, accessing each item via the `each` keyword, which is comprised of key-value pairs.

Using Terraform `for_each` with a set
-------------------------------------

In Terraform, **sets** offer a means to define a collection of items for configuring multiple resource instances using `for_each`. If working with a list, the `toset()` function can be employed to convert it to a set, as lists are not directly supported by `for_each`.

Let’s take a look at doing this with both a `resource` block and Terraform Modules…

### Use `for_each` on a resource block

Consider the following example, where we define a list of Azure Resource Group names and employ `for_each` to configure multiple resource groups:

```
resource azurerm_resource_group "resource_groups" {
  for_each = toset([
    "prod-b59-webapp1-rg",
    "prod-b59-database1-rg"
  ])

  name     = each.key
  location = "eastus"
}
```


This example will provision multiple Azure Resource Groups by iterating over the set of strings provided to `for_each` via `toset()`. The `each.key` is utilized to access the string value for each of the items in the collection.

### Use `for_each` on a Terraform Module block

Similarly, when using **Terraform Modules**, `for_each` can be employed to configure `module` blocks too:

```
module "resource_groups" {
  for_each = toset([
    "b59-prod-eus-webapp",
    "b59-prod-eus-database"
  ])

  source = "./resource_groups_module"

  name = "${each.key}-rg"
}
```


In this example, a set is defined to specify the instances of the module, and `each.key` is used within expressions to customize the configurations accordingly.

> **What are Terraform Modules?** Terraform Modules are a way to create blocks of Terraform HCL (HashiCorp Configuration Language) code that is reusable either within a single Terraform project, or even reusable across multiple Terraform projects.

Using Terraform `for_each` with a map
-------------------------------------

Maps serve as a means to define collections of key-value pairs in Terraform. Consider the following example of using `for_each` with a map of key-value pairs.

Here’s the key-value pair map definition:

```
locals {
  resource_groups = {
    "b59-prod-eus-webapp-rg" = "eastus"
    "b59-prod-eus-database-rg" = "eastus"
  }
}
```


Utilising this map, we can configure Azure Resource Groups using `for_each` as in the following examples:

```
resource azurerm_resource_group "resource_groups" {
  for_each = local.resource_groups

  name     = each.key
  location = each.value
}
```


In this example, `for_each` iterates over the map, enabling the configuration of multiple Azure Resource Groups with the `location` attribute set to the `each.value` of the map.

Using Terraform `for_each` with a map of Objects
------------------------------------------------

Expanding on using `for_each` with maps, you can utilize a map of Objects to define more complex configurations.

Here’s an example map of Objects:

```
locals {
  virtual_machines = {
    "b59-prod-eus-vm" = {
      location = "eastus"
      size = "Standard_B2s"
    }
    "b59-prod-wus-vm" = {
      location = "westus"
      size = "Standard_B4ms"
    }
  }
}
```


By using `for_each` and passing it the map, you can configure multiple resources, such as Azure Virtual Machines in the following example:

```
resource azurerm_virtual_machine "vm" {
  for_each = local.virtual_machines

  name     = each.key
  location = each.value.location
  vm_size  = each.value.size
  
  # Additional VM configurations here
}
```

<br/>
<br/>
<br/>


In this page, lets look at how we can handle a ‘for loop’ in Terraform. Meta-arguments such as `count` and `for_each` can be used for different use cases when you want to repeat a set of actions multiple times.

We will look at each one in turn with examples, before looking at how to use the Terraform `for` expression with an `if` clause. Let’s dive in!


What is a Terraform for loop?[](#what-is-a-terraform-for-loop)
--------------------------------------------------------------

A Terraform `for` loop is pretty similar to a loop in any programming language. The key difference, however, is that you can use loops only when building maps or listing comprehension expressions.

The `for` expression can be used to transform values and can be used with the `if` clause to include or exclude expressions based on a boolean condition.

Types of loops in Terraform[](#types-of-loops-in-terraform)
-----------------------------------------------------------

By default, a [resource block](https://developer.hashicorp.com/terraform/language/resources/syntax) configures one object. Using a **loop,** you can manage several similar objects without writing a separate block for each one. This reduces the amount of code you need to write and makes your scripts cleaner.

**Two meta-arguments** can be used to do this in Terraform:

*   `count` – This looping construct creates a fixed number of resources based on a count value.
*   `for_each` – This looping construct allows you to create multiple instances of a resource based on a set of input values, such as a list or map.

If the resources you are provisioning are identical or nearly identical, then `count` is a safe bet. However, if elements of the resources change between the different instances, then `for_each` is the way to go.

You can also use the `for` _expression_ to transform a value on each item in a list or map. Use `for` when you need to iterate over a set of input values and perform some action on each value.

Terraform count, for\_each and for comparison[](#terraform-count-foreach-and-for-comparison)
--------------------------------------------------------------------------------------------

Below you can find the table comparison of Terraform `count`, `for_each` and `for`.


| Construct | Type | Description | Use Case |
|--|--|--|--|
|Count | Meta-Argument | Based on a count value | Resources you are provisioning are identical |
|For_each | Meta-Argument |  Based on a set of input values |  Resources change between the different instances |
|For | Expression | Based on a set of input values | Transform a value |


Benefits of using loops in Terraform[](#benefits-of-using-loops-in-terraform)
-----------------------------------------------------------------------------

One of the key benefits of using loops in Terraform is the fact that you can easily build powerful expressions that your resources can leverage. It makes your code reusable and, in the end, minimizes the amount of code you have to write to achieve the desired result. Combining for loops with ifs lets you easily reuse variables in many resources.

In a nutshell, Terraform `for` loops help with:

*   Code reusability
*   Dynamic configurations
*   Improved scalability
*   Easier resource management
*   Conditional creation of resources
*   Enhanced error handling
*   Support for complex data structures (such as nested lists or maps)

Let’s take a look at some examples.

### Using Terraform count[](#using-terraform-count)

The example below uses the `count` meta-argument to loop through a list of storage account names and create a storage account with the name specified for each.

The name argument uses the `count.index` expression to access the current index of the loop (starting from 0) and select the storage account name from the `storage_account_names` list using the index. The rest of the arguments are the same for each storage account.

```
variable "storage_account_names" {
  type    = list(string)
  default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "my_storage" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
```


### Using Terraform for\_each[](#using-terraform-foreach)

The example below uses a `for_each` loop to iterate through a list of the same storage account names and create a storage account with the name specified for each. The rest of the arguments are the same for each storage account.

The result will be the same as the example using `count` above.

```
variable "storage_account_names" {
  type    = list(string)
  default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "my_storage" {
  for_each                 = toset(var.storage_account_names)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
```


### Using the for expression[](#using-the-for-expression)

The example below builds on the previous one and shows how to output a list of storage account IDs from the given list. The `for` expression is used to iterate over the `storage_account_names` list and retrieve the ID for each storage account instance with the corresponding name.

```
variable "storage_account_names" {
  type    = list(string)
  default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "my_storage" {
  for_each                 = toset(var.storage_account_names)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

output "storage_account_names" {
  value = [
    for storage in var.storage_account_names:
    azurerm_storage_account.my_storage.example[storage].id
  ]
}
```


The Terraform for rxpression with is clause[](#the-terraform-for-rxpression-with-is-clause)
-------------------------------------------------------------------------------------------

A `for` expression can also include an `if` clause to filter elements from the source variable, producing a value with fewer elements than the source value, and is commonly used to split lists based on a condition.

The syntax looks like the below:

```
[for VAR in COLLECTION: IF CONDITION_EXPRESSION: VAR]
```


`VAR` is the name of the variable that represents each item in the collection, `COLLECTION` is the collection to be filtered, and `CONDITION_EXPRESSION` is the boolean expression that determines whether each item should be included in the filtered collection.

In the example below, we use the `for` expression with the `if` condition to output a list of storage account names that have the `account_replication_type` set to `GRS`. This example will output the three storage account names provided in the `storage_account_names` variable, as they will all have their `account_replication_type` set to `GRS`.

```
variable "storage_account_names" {
  type    = list(string)
  default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "my_storage" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

locals {
  grs_storage_accounts = [for sa in azurerm_storage_account.my_storage: sa if sa.account_replication_type == "GRS"]
}

output "grs_storage_account_names" {
  value = [for sa in local.grs_storage_accounts: sa.name]
}
```


The Terraform for\_each expression with if clause[](#the-terraform-foreach-expression-with-if-clause)
-----------------------------------------------------------------------------------------------------

The `if` clause can be used to conditionally include or exclude certain expressions based on a boolean condition.

The syntax for using the `if` clause in an expression is as follows:

```
${condition ? true_value : false_value}
```


In the example below, we use the `if` condition to set the `account_replication_type` to `GRS` if the `environment` variable is set to `prod` , if it is not, then the `account_replication_type` will be set to `LRS` .

Because the default value for the `environment` variable is set to `prod` in the below example, the three storage accounts created using the `for_each` loop will all have their `account_replication_type`set to `GRS`.

```
variable "storage_account_names" {
  type    = list(string)
  default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
}

variable "environment" {
  default = "prod"
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "my_storage" {
  for_each                 = toset(var.storage_account_names)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "${var.environment == "prod" ? "GRS" : "LRS"}"
}
```


Nested Terraform for loops[](#nested-terraform-for-loops)
---------------------------------------------------------

When you are working with complex data structures, you need to use nested **`for`** loops to easily reuse configurations. DevOps engineers like to use YAML files for most of their configurations, and you can use these files as variables in Terraform, too.

Let’s take a look at an example that contains a nested YAML and how we would go for parsing that input:

```
instances:
 instance1:
   ami: ami1
   shape: t2-micro
   env: dev
 instance2:
   ami: ami2
   shape: t2-micro
   env: dev
 instance3:
   ami: ami1
   shape: t2-micro
   env: stage
 instance4:
   ami: ami2
   shape: t2-micro
   env: stage
```


In this YAML file, we have declared a couple of instances. Two of them will be used for the dev environment, and the other two will be used for the stage environment.

To read the data from the YAML file, we need to use the file function and to transform the data into a map, we will need to use the YAML decode function:

```
locals {
 data  = yamldecode(file("./data.yaml"))
}
```


Next, if we want to take only the instances that are in the dev environment and build a map with them, we will use a series of expressions:

```
dev   = merge([for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "dev" }]...)
```


Let’s break it down and forget about the merge function for now:

*   Initially, we do a `for` loop to enter the instance map and use a list for that (we don’t need key/value pairs at this point).
*   Next, as we also want to rebuild the data with key-value pairs, we loop using both the key and the value for each instance.
*   We rebuild the data only if the value of the environment is dev.

At this point, the dev data would look like this:

```
dev   = [for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "dev" }]
```


The value of the data would be:

```
dev = [
  {
    "instance1" = {
      "ami" = "ami1"
      "env" = "dev"
      "shape" = "t2-micro"
    }
    "instance2" = {
      "ami" = "ami2"
      "env" = "dev"
      "shape" = "t2-micro"
    }
  },
]
```


This is a list of maps and it would be hard to use in a `for_each` loop, so we use the merge function with an ellipsis at the end to transform this into a map:

```
dev = {
  "instance1" = {
    "ami" = "ami1"
    "env" = "dev"
    "shape" = "t2-micro"
  }
  "instance2" = {
    "ami" = "ami2"
    "env" = "dev"
    "shape" = "t2-micro"
  }
}
```


The entire setup that also shows the data is:

```
locals {
 data  = yamldecode(file("./data.yaml"))
 dev   = merge([for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "dev" }]...)
 stage = merge([for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "stage" }]...)

}


output "dev" {
 value = local.dev
}

output "stage" {
 value = local.stage
}
```


Terraform for loop with a map[](#terraform-for-loop-with-a-map)
---------------------------------------------------------------

As you’ve seen in the nested `for` loops example, you can use a loop over a map too. You can also iterate through both the keys and the values, and if you use a single iterator, it will iterate through the values. Let’s see it in action:

```
locals {
 pet_map = {
   cat = {
     color = "orange"
     age   = "7"
   }
   dog = {
     color = "white"
     age   = "5"
   }
 }

 pet_colors = [for pet in local.pet_map : pet.color]
}

output "pet_colors" {
 value = local.pet_colors
}


Apply complete! Resources: 0 added, 0 changed, 1 destroyed.

Outputs:

pet_colors = [
 "orange",
 "white",
]
```


In this example, we’ve just iterated through the values. Now, let’s also iterate through the keys, and create a list of the pets:

```
locals {
 pet_map = {
   cat = {
     color = "orange"
     age   = "7"
   }
   dog = {
     color = "white"
     age   = "5"
   }
 }

 pet_type = [for pet, pet_values in local.pet_map : pet]
}

output "pet_colors" {
 value = local.pet_type
}

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

pet_colors = [
 "cat",
 "dog",
]
```


Terraform for loop with a list[](#terraform-for-loop-with-a-list)
-----------------------------------------------------------------

When iterating through lists, by using a single iterator, you will get the values one by one, and if you are using two iterators, the first one will be the index, and the other one will be the value.

Let’s take a look at an example that recreates a list with only the even numbers:

```
locals {
 my_numbers   = [1, 3, 5, 2, 8, 12, 33, 10]
 even_numbers = [for number in local.my_numbers : number if number % 2 == 0]
}

output "even_numbers" {
 value = local.even_numbers
}


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

even_numbers = [
 2,
 8,
 12,
]
```


Now, we will create a list with the index positions for the numbers that are even:

```
locals {
 my_numbers   = [1, 3, 5, 2, 8, 12, 33, 10]
 even_numbers = [for index, number in local.my_numbers : index if number % 2 == 0]
}

output "even_numbers" {
 value = local.even_numbers
}

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

even_numbers = [
 3,
 4,
 5,
 7,
]
```


Terraform for loop best practices[](#terraform-for-loop-best-practices)
-----------------------------------------------------------------------

There are a couple of things you should have in mind when you are using `for` loops in Terraform:

*   Keep the number of loops you use to a minimum to make your code easier to understand. This way, the scope is kept narrow, and issues will be easier to debug.
*   `For` loops should be used in locals to simplify the resource configuration. Also, local variables can be easily reused if you need to do so.
*   Test incrementally – when you are designing a complex loop, go step by step, it will be easier to master how to use loops in any scenario
*   Document your loops
*   Use descriptive variable names

Even if these are not 100% specific to `for` loop, for looping in Terraform in general, try to use `for_each` instead of `count` all over the place and take advantage of dynamic blocks.

Key Points[](#key-points)
-------------------------

Terraform has two meta-arguments for performing for loops, `count` and `for_each`. `count`should be used when you are provisioning multiple resources that are identical or near identical, and `for_each` should be used when resources change between different instances.
