terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/azurerm"
      version = "= 3.3.0"
    }
  }
}

data "azurerm_resource_group" "host" {
  name = var.rg_name
}

resource "azurerm_virtual_network" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.host.name
  address_space       = ["10.0.0.0/16"]
}
