resource "azurerm_mssql_database" "example" {
    for_each = var.mssql_database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.example[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}

variable "mssql_database" {
  type = any
}

data "azurerm_mssql_server" "example" {
  for_each = var.mssql_database
  name     = each.value.server_name
  resource_group_name = each.value.resource_group_name
}