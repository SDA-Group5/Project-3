variable "server_name" {
  description = "The name of the SQL Server."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the SQL Server should be created."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the SQL Server should be created."
  type        = string
  
}

variable "server_version" {
  description = "The version of the SQL Server."
  type        = string
  default     = "12.0"
  
}

variable "username" {
  description = "The administrator username for the SQL Server."
  type        = string
  
}

variable "password" {
  description = "The administrator password for the SQL Server."
  type        = string
  
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
  
}

variable "sku_name" {
  description = "The SKU name for the SQL Database."
  type        = string
  default     = "S0"
  
}

variable "sql_subnet_id" {}




