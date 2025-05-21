data "kubernetes_service" "grafana" {
  metadata {
    name      = "monitoring-grafana"
    namespace = "monitoring"
  }

  depends_on = [helm_release.kube_prometheus_stack]
}

data "kubernetes_service" "prometheus" {
  metadata {
    name      = "monitoring-kube-prometheus-prometheus"
    namespace = "monitoring"
  }

  depends_on = [helm_release.kube_prometheus_stack]
}


output "grafana_ip" {
  value = data.kubernetes_service.grafana.status[0].load_balancer[0].ingress[0].ip
}

output "prometheus_ip" {
  value = data.kubernetes_service.prometheus.status[0].load_balancer[0].ingress[0].ip
}

output "grafana_url" {
  value       = "http://${data.kubernetes_service.grafana.status[0].load_balancer[0].ingress[0].ip}:80"
  description = "The external URL for Grafana UI"
}

output "prometheus_url" {
  value       = "http://${data.kubernetes_service.prometheus.status[0].load_balancer[0].ingress[0].ip}:9090"
  description = "The external URL for Prometheus UI"
}

