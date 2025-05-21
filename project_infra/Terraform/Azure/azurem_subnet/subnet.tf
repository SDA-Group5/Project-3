resource "azurerm_subnet" "subnet" {
    resource_group_name = var.resource_group_name

    name = var.name
    virtual_network_name = var.vnet_name
    address_prefixes     = var.address_prefixes    
}

resource "azurerm_subnet" "sql_subnet" {
  name                 = var.sql_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.sql_address_prefixes
}
