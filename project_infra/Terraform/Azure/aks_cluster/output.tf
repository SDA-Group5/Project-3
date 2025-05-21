output "kube_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "kube_client_cert" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "kube_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "kube_ca_cert" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config 
}

### Output Ingress IP:
data "kubernetes_service" "nginx_ingress" {
  metadata {
    name      = "nginx-ingress-ingress-nginx-controller"
    namespace = "ingress-nginx"
  }

  depends_on = [helm_release.nginx_ingress]
}

output "nginx_ingress_ip" {
  value       = try(data.kubernetes_service.nginx_ingress.status[0].load_balancer[0].ingress[0].ip, "pending")
  description = "Public IP address of the NGINX Ingress controller"
}

