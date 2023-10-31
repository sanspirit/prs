variable "organisation" {
  type        = string
  default     = "rlg"
  description = "(Optional) The organisation within the group.  Defaults to 'rlg'."
}

variable "subscription_short_name" {
  type        = string
  description = "(Required) The abbreviated name of the subscription.s."

  validation {
    condition     = can(regex("^[A-Za-z-]+$", var.subscription_short_name))
    error_message = "The subscription_short_name can only contain letters and hyphens."
  }
}

variable "environment" {
  type        = string
  description = "The name of the environment, e.g. dev, test, prd etc."

  validation {
    condition     = can(regex("^[[:alpha:]]+$", var.environment))
    error_message = "The environment can only contain letters."
  }
}

variable "name_suffix" {
  type        = string
  default     = ""
  description = "(Optional) Unique suffix appended to the name of the SQL Server.  Defaults to the empty string."
}

variable "resource_group_name" {
  description = "(Required) Name of the resource group to be imported."
  type        = string
  nullable    = false
}

variable "location" {
  type        = string
  description = "(Required) The location/region where the resources will be created."

  validation {
    condition     = can(regex("(?i)uksouth|ukwest", var.location))
    error_message = "The region where the resources will be provisioned. Valid options are UKSouth and UKWest (case insensitive)."
  }
}

variable "tags" {
  description = "(Required) A mapping of tags to assign to the resource."
  type        = map(any)

  validation {
    condition = (
      length(setsubtract(["AppID", "BusinessUnit", "CostCentre", "Criticality", "Environment", "Owner"], keys(var.tags))) == 0 &&
      var.tags["AppID"] != "" &&
      var.tags["BusinessUnit"] != "" &&
      var.tags["CostCentre"] != "" &&
      var.tags["Criticality"] != "" &&
      var.tags["Environment"] != "" &&
      var.tags["Owner"] != ""
    )
    error_message = "The tags map must contain keys \"AppID\", \"BusinessUnit\", \"CostCentre\", \"Criticality\", \"Environment\" and \"Owner\", and all of these keys must have a non-empty string value."
  }
}

variable "sql_server_name" {
  description = "(Required) The name of the SQL Azure Instance to attach the database to"
  type        = string
  nullable    = false
}

variable "sql_server_resource_group" {
  description = "(Required) The Resource Group Name of which the SQL Azure Instance to attach the database to is location in"
  type        = string
  nullable    = false
}

variable "database_collation" {
  description = "(Optional) Collation to set the database to"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  nullable    = false
}

variable "license_type" {
  description = "(Optional) License Type (defaults to LicenseIncluded)"
  type        = string
  default     = "LicenseIncluded"
  nullable    = false
}

variable "database_sku" {
  description = "(Required) SKU for the database"
  type        = string
  nullable    = false
}

variable "database_max_size_gb" {
  description = "(Optional) Max size in Gb for the database (defaults to 1Gb)"
  type        = number
  default     = 1
  nullable    = false
}

variable "database_zone_redundant" {
  description = "(Optional) Enable Zone Redundancy for the database (defaults to false)"
  type        = bool
  default     = false
  nullable    = false
}

variable "identity_to_assign" {
  description = "(Optional) Identity to assign to the database"
  type        = string
  nullable    = true
  default     = null
}

variable "access_role_to_assign" {
  description = "(Optional) Database role to assign to the identity in the database"
  type        = string
  default     = "db_datareader"
}

variable "action_group_name" {
  description = "(Optional) Action Group Name to use for alerting"
  type        = string
  nullable    = true
  default     = null
}

variable "action_group_resource_group_name" {
  description = "(Optional) Resource Group Name which contains the Action Group for use for alerting"
  type        = string
  nullable    = true
  default     = null
}

variable "sql_server_id" {
  description = "id of the SQL Server"
  type = string
}

variable "alerts_action_group_id" {
  description = "ID of the action group to associate with alerts"
  type        = string
  default     = null
}