resource "azurerm_storage_account" "Storage" {
    for_each = var.store
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
}

variable "store" {
  type = any
}

resource "azurerm_storage_account" "Storage2" {
    for_each = var.store
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
}
