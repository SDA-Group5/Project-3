resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  node_resource_group = var.node_resource_group_name

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.nodes_count
    vm_size    = var.vm_size
  }

  identity {
    type = var.identity_type
  }
 
}
#########################

# Install NGINX Ingress with Helm
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "controller.ingressClassResource.name"
    value = "nginx"
  }
  lifecycle {
    ignore_changes = [
      repository,  # Ignore changes to the Helm repo URL
      chart,       # Ignore changes to the chart name
      version,     # Ignore version updates
      set,         # Ignore changes to `set` blocks
      values       # Ignore changes to `values` files
    ]
  }
}