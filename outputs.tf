output "app_service_url" {
  value = module.appservice.app_url
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "vm_public_ip" {
  value = module.vm.vm_public_ip
}
output "keyvault_name" {
  value = module.keyvault.keyvault_name
}

output "keyvault_id" {
  value = module.keyvault.keyvault_id
}
output "current_object_id" {
  value = data.azurerm_client_config.current.object_id
}