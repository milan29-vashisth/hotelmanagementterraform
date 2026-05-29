terraform {
  required_version = ">=1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6349a94a-bcc7-4da7-8f36-2f6bc3017bf7"
}