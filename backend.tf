terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-milan"
    storage_account_name = "milantfstate2026"
    container_name       = "tfstate"
    key                  = "hotel-dev.tfstate"
  }
}