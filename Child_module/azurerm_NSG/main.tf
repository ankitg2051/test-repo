resource "azurerm_network_security_group" "nsg" {
    for_each = var.network_security_group
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic security_rule {
    for_each = each.value.security_rules
    content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.source_port_range
    destination_port_ranges     = security_rule.value.destination_port_ranges
    source_address_prefix      = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
    }
}
}
variable "network_security_group" {
  type = any
}