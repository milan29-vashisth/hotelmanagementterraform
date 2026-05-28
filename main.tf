module "appservice" {
  source = "./modules/appservice"

  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
}