variable "private_dns_zone_names" {
  description = "The private dns zone to be created for internal vnet resolution"
  default     = null
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure DNS resides"
  type        = string
}

variable "virtual_network_id" {
  description = "The name of the resource group where the Azure DNS resides"
  type        = string
}

variable "private_dns_records_names" {
  description = "The region where the keyvolt is created."
  type = list(string)
}

variable "use_for_each" {
  description = "Use `for_each` instead of `count` to create multiple resource instances."
  type        = bool
  default     = false
  nullable    = false
}
