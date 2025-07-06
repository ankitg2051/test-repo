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

module "subnets" {
  depends_on = [module.vnetwork]
  source     = "../Child_module/azurerm_subnets"
  subnet     = var.subnets
}

module "public_ipp" {
    depends_on = [ module.bag ]
    source = "../Child_module/azurerm_public_IP"
    public_ips = var.public_ipss
}

module "NIC_card" {
  source = "../Child_module/azurerm_NIC+VM"
  depends_on = [module.subnets,module.NSG, module.public_ipp]
  network_interface = var.nic_map
  pub-ip = var.public_ipss
  virtual_machine = var.virtual_machine
}

module "NSG" {
  source = "../Child_module/azurerm_NSG"
  depends_on = [module.subnets]
  network_security_group = var.network_security_group
}

module "SQL_server" {
  source = "../Child_module/azurerm_SQL_server"
  depends_on = [module.bag]
  mssql_server = var.sql_server
}

module "named_sql_database" {
  source = "../Child_module/azurerm_SQL_database"
  depends_on = [module.SQL_server]
  mssql_database = var.sql_database
}

module "key_vault" {
  source = "../Child_module/azurerm_key_vault"
  depends_on = [module.bag]
  key_vaults = var.key_vaults
}