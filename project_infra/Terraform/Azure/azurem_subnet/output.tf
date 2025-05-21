output "subnet" {
  value = azurerm_subnet.subnet
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "sql_subnet_id" {
  value = azurerm_subnet.sql_subnet.id
}