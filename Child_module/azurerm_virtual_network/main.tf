resource "azurerm_virtual_network" "virtual_net" {
    for_each = var.vnet
    name                = each.value.name 
    address_space       = each.value.address_space
    location            = each.value.location
    resource_group_name = each.value.resource_group
}

variable "vnet" {
    type = map(object({
        name                = string
        address_space       = list(string)
        location            = string
        resource_group      = string
    }))
}