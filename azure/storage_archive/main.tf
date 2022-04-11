terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/azurerm"
      version = "= 3.1.0"
    }
  }

}

resource "azurerm_resource_group" "archive" {
  name     = "archive-resources"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "sjearchive00010"
  resource_group_name      = azurerm_resource_group.archive.name
  location                 = azurerm_resource_group.archive.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    role = "archive"
  }
}
