resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "appservice" {
  source = "./modules/appservice"

  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
}

module "acr" {
  source = "./modules/acr"

  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}

module "vm" {
  source = "./modules/vm"

  resource_group_name = var.resource_group_name
  location            = var.location

  vm_name        = var.vm_name
  admin_username = var.admin_username
  admin_password = var.admin_password
}