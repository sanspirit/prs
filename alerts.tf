
resource "azurerm_monitor_activity_log_alert" "resource_health" {
  count = var.action_group_name != null ? 1 : 0
  
  name = "${azurerm_mssql_database.sql_database.name}-resource-health-alert"
  
  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "This alert will monitor the resource health of the sql database"

  criteria {
    resource_id = azurerm_mssql_database.sql_database.id
    category    = "ResourceHealth"
    resource_health {
      current  = ["Degraded", "Unavailable", "Unknown"]
      previous = ["Available"]
      reason   = ["PlatformInitiated", "UserInitiated", "Unknown"]
    }
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "alert_cpu_high_80" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-cpu-percent-80-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the CPU percent is greater than 80%"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  window_size = "PT5M"
  frequency   = "PT1M"

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "alert_cpu_high_95" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-cpu-percent-95-alert"
  
  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the CPU percent is greater than 95%"
  severity            = 0

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 95
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "dtu_usage_high_80" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-resource-health-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the dtu usage  is greater than 80%"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "dtu_used"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "dtu_usage_high_95" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-dtu-usage-95-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the dtu usage  is greater than 95%"
  severity            = 0

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "dtu_used"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 95
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "deadlock_in_app" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-deadlock-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when there is a deadlock alert"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "deadlock"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "storage_high_80" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-storage-80-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the storage is greater than 80%"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_monitor_metric_alert" "storage_high_95" {
  count = var.action_group_name != null ? 1 : 0

  name = "${azurerm_mssql_database.sql_database.name}-storage-95-alert"

  resource_group_name = var.resource_group_name
  tags                = var.tags
  scopes              = [azurerm_mssql_database.sql_database.id]
  description         = "Action will be triggered when the storage is greater than 95%"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 95
  }

  action {
    action_group_id = var.alerts_action_group_id
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
