output "sql_database_id" {
  description = "The Azure SQL Database ID."
  value       = azurerm_mssql_database.sql_database.id
}
