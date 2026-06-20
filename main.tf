resource "azurerm_resource_group" "rg" {
  name     = "app-test-dev-rg"
  location = "East US 2"
}
module "appservice" {
  source = "./modules/appservice"

  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
   depends_on = [azurerm_resource_group.rg]
  
}

module "acr" {
  source = "./modules/acr"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  acr_name            = var.acr_name
   depends_on = [azurerm_resource_group.rg]
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
   depends_on = [azurerm_resource_group.rg]
}
# module "aks" {
#   source              = "./modules/aks"
#   aks_name            = var.aks_name
#   location            = var.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = "hotelaks"
# }