module "resource_group" {
  source   = "../Azure/azurerm_resource_group"
  name     = "${local.prefix}-RG"
  location = local.location
}

module "vnet" {
  source              = "../Azure/azurerm_virtual_network"
  name                =  "${local.prefix}-vnet"
  location            = module.resource_group.resource_group_location
  address_space       = local.vnet_address_space
  resource_group_name = module.resource_group.resource_group_name
}

module "subnet" {
  source = "../Azure/azurem_subnet"
  name = "subnet"
  vnet_name = module.vnet.virtual_network.name
  resource_group_name = module.resource_group.resource_group_name
  address_prefixes = local.subnet_address_prefixes
}

module "aks" {
  source = "../Azure/aks_cluster"
  name = "${local.prefix}-aks"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
  dns_prefix = "${local.prefix}-dns"
  vm_size = local.vm_size
  nodes_count = local.nodes_count
  identity_type = "SystemAssigned"
  node_resource_group_name = "${local.prefix}-aks"
  default_node_pool_name = local.default_node_pool_name
}

module "sql" {
  source = "../Azure/azurerm_sql"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
  username = local.sql_db_username
  password = local.sql_db_password
  server_name = local.sql_server_name
  

  sql_database_name = "${local.prefix}-DB"
  sku_name = local.sku_name
}



