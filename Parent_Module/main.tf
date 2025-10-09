module "bag" {
  source = "../Child_module/azurerm_resource_group"
  rg     = var.resource_group
}

module "Store1" {
  depends_on = [module.bag]
  source     = "../Child_module/azurerm_storage_account"
  store      = var.storage
}

module "vnetwork" {
  depends_on = [module.bag]
  source     = "../Child_module/azurerm_virtual_network"
  vnet       = var.vn
}
