variable "name" {
  description = "values for the name of the virtual network"
  type        = string
}
variable "location" {
  description = "values for the location of the virtual network"
  type        = string
  
}
variable "address_space" {
  description = "values for the address space of the virtual network"
  default     = []
  
}
variable "resource_group_name" {
  description = "resource_group_name"
}