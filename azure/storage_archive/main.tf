terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.1.0"
    }
  }

}

resource "azurerm_resource_group" "archive_rg" {
  name     = "archive-resources"
  location = var.azure_location
}

resource "azurerm_storage_account" "example" {
  name                     = "sjearchive00010"
  resource_group_name      = azurerm_resource_group.archive_rg.name
  location                 = azurerm_resource_group.archive_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    role = "archive"
  }
}
