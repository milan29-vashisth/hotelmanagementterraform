resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  //enable_rbac_authorization = true
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  value        = "MySecret123"
  key_vault_id = azurerm_key_vault.kv.id
}