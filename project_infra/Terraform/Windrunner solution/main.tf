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
  source              = "../Azure/azurem_subnet"
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.vnet.vnet_name


  name                = "${local.prefix}-app-subnet"
  address_prefixes    = ["10.0.1.0/24"]

  sql_subnet_name         = "${local.prefix}-sql-subnet"
  sql_address_prefixes    = ["10.0.2.0/24"]
}


provider "kubernetes" {
  alias = "aks"
  host                   = module.aks.kube_host
  client_certificate     = base64decode(module.aks.kube_client_cert)
  client_key             = base64decode(module.aks.kube_client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_ca_cert)
}

provider "helm" {
  alias = "aks"
  kubernetes {
    host                   = module.aks.kube_host
    client_certificate     = base64decode(module.aks.kube_client_cert)
    client_key             = base64decode(module.aks.kube_client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_ca_cert)
  }
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
  source              = "../Azure/azurerm_sql"
  server_name         = local.sql_server_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  username            = local.sql_db_username
  password            = local.sql_db_password
  sql_database_name   = "${local.prefix}-DB"
  sku_name            = "Basic"
  sql_subnet_id       = module.subnet.sql_subnet_id
}


module "monitoring" {
  source = "../Azure/monitoring"

  kube_host        = module.aks.kube_host
  kube_client_cert = module.aks.kube_client_cert
  kube_client_key  = module.aks.kube_client_key
  kube_ca_cert     = module.aks.kube_ca_cert

  providers = {
    kubernetes = kubernetes.aks
    helm       = helm.aks
  }
}









