variable "env_global_config" {
  type        = string
  description = "The name of the json file that will hold the config for this environment"
}

variable "env_specific_config" {
  type        = string
  description = "The name of the json file that will hold the config for this environment"
}

variable "env_specific_nsg_rules" {
  type        = string
  description = "The name of the csv file that will hold the nsg ruleset for this environment"
}

variable "env_specific_route_rules" {
  type        = string
  description = "The name of the csv file that will hold the route ruleset for this environment"
}

variable "disable_bgp_route_propagation" {
  type        = string
  description = "Set route propergation on route table"
  default     = true
}

variable "newrelickey" {
  type        = string
  description = "(secret) Newrelic product key"
}
