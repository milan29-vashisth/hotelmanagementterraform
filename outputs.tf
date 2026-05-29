output "app_service_url" {
  value = module.appservice.app_url
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "vm_public_ip" {
  value = module.vm.vm_public_ip
}