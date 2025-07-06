resource "azurerm_network_interface" "nic" {
    for_each = var.network_interface
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.example[each.key].id
    
  }
}

variable "network_interface" {
  type = any
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.virtual_machine
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}

variable "virtual_machine" {
  type = any
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  for_each                  = var.network_interface
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
