resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.username
  administrator_login_password = var.password

}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  
  server_id = azurerm_mssql_server.sql_server.id

  sku_name = var.sku_name

  
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "${var.server_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sql_subnet_id

  private_service_connection {
    name                           = "sql-privatesc"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}

resource "azurerm_mssql_firewall_rule" "allow_all" { 
  name             = "AllowAllAzureIps"
  server_id = azurerm_mssql_server.sql_server.id 
  start_ip_address = "0.0.0.0" 
  end_ip_address   = "0.0.0.0" 
}


 