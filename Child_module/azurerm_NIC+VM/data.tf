data "azurerm_subnet" "subnet" {
    for_each = var.network_interface
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.subnet_rg
}

data "azurerm_public_ip" "example" {
    for_each = var.pub-ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}


variable "pub-ip" {
  type = any
}

data "azurerm_network_security_group" "nsg" {
  for_each = var.network_interface
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

