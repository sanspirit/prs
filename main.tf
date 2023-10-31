terraform {
  required_version = ">= 1.3.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.39"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.2"
    }
  }
}

module "naming" {
  source   = "terraformregistry.royallondongroup.com/royallondon/resource-naming/azurerm"
  version  = "2.0.0"
  env      = lower(var.environment)
  location = lower(var.location)
  sub      = lower(var.subscription_short_name)
  org      = lower(var.organisation)
}

