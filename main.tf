resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
module "appservice" {
  source = "./modules/appservice"

  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
  depends_on            = [azurerm_resource_group.rg]

}

module "acr" {
  source = "./modules/acr"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  acr_name            = var.acr_name
  depends_on          = [azurerm_resource_group.rg]
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  depends_on          = [azurerm_resource_group.rg]
}
module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.aks_name}-dns"
}
data "azurerm_client_config" "current" {}
module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id

}
