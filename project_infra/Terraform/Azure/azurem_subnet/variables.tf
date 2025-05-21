variable "name" {
  description = "Name of the subnet"
  type        = string
  
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  
}
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  
}
variable "address_prefixes" {
  description = "Address prefixes for the subnet"
  default     = []
  
}

variable "sql_subnet_name" {}
variable "sql_address_prefixes" {
  type = list(string)
}



