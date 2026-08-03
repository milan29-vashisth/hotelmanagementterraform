output "keyvault_id" {
  value = azurerm_key_vault.kv.id
}

output "keyvault_name" {
  value = azurerm_key_vault.kv.name
}

output "secret_name" {
  value = azurerm_key_vault_secret.db_password.name
}