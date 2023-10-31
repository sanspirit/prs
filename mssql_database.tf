locals {
  sql_db_name = lower("${module.naming.standard["sql-database"]}-sql${local.hyphenated_name_suffix}")
}

resource "azurerm_mssql_database" "sql_database" {
  name           = local.sql_db_name
  server_id      = var.sql_server_id
  collation      = var.database_collation
  license_type   = var.license_type
  max_size_gb    = var.database_max_size_gb
  sku_name       = var.database_sku
  zone_redundant = var.database_zone_redundant
  tags           = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
