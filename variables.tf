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

