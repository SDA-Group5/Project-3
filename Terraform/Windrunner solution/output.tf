
output "aks_kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "sql_db_name" {
  value = module.sql.sql_database_name
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}


