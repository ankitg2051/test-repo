resource "azurerm_key_vault" "example" {
    for_each = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
    "Get", "Create", "List", "Encrypt", "Decrypt", "Delete", "Sign", "Verify"
  ]

  secret_permissions = [
    "Get", "Set", "Delete", "List"
  ]

  storage_permissions = [
    "Get", "List", "Set", "Delete", "RegenerateKey"
  ]
  }
}

data "azurerm_client_config" "current" {}

variable "key_vaults" {
type = any
}
