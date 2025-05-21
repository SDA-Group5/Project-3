output "virtual_network" {
  value = azurerm_virtual_network.virtual_network
}

output "vnet_name" {
  value = azurerm_virtual_network.virtual_network.name
}