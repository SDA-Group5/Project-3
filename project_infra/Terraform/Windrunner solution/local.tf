locals {

  prefix = "DevOps1-Windrunners-project"  
  location = "Switzerland North"

  vnet_address_space = ["10.0.0.0/16"]

  subnet_address_prefixes = ["10.0.1.0/24"]

  default_node_pool_name = "projcetnodes"
  vm_size = "Standard_A2_v2"
  nodes_count = 2

  sql_server_name = "devops-windrunners-sql-server"
  sql_db_username = "Windrunners"
  sql_db_password = "DevOps@final@project"
  sku_name             = "Basic"

}