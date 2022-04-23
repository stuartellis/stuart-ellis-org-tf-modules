terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.3.0"
    }
  }
}

resource "azurerm_resource_group" "main" {
  name     = var.name
  location = var.location
}
