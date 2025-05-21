output "resource_group_name" {
  value       = module.resource_group.resource_group_name
}

output "sql_db_name" {
  value = module.sql.sql_database_name
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "nginx_ingress_ip" {
  value       = module.aks.nginx_ingress_ip
  description = "The public IP of the NGINX Ingress controller"
}

output "grafana_url" {
  value = module.monitoring.grafana_url
}

output "prometheus_url" {
  value = module.monitoring.prometheus_url
}
