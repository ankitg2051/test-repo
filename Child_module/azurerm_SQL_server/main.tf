resource "azurerm_mssql_server" "example" {
    for_each = var.mssql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
    location                     = each.value.location
    version                      = each.value.version
    administrator_login          = each.value.administrator_login
    administrator_login_password = each.value.administrator_login_password
}

variable "mssql_server" {
  type = any
}   

