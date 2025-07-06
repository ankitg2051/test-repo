#Just to check if the file is being read correctly
# This file contains the variables for the Parent Module in Terraform
# just to check if the file is being read correctly

resource_group = {
  "rg1" = {
    "name"     = "ankit-rg"
    "location" = "East Asia"
  }
  "rg2" = {
    "name"     = "ankit-rg2"
    "location" = "East Asia"
  }
}
storage = {
  "store1" = {
    "name"                     = "storeforblob1"
    "location"                 = "East Asia"
    "resource_group"           = "ankit-rg"
    "account_tier"             = "Standard"
    "account_replication_type" = "LRS"
  }
}

vn = {
  "vnet1" = {
    "name"           = "vnet1"
    "address_space"  = ["10.0.0.0/16"]
    "location"       = "East Asia"
    "resource_group" = "ankit-rg"
  }
  "vnet2" = {
    "name"           = "vnet2"
    "address_space"  = ["10,0.0.0/16"]
    "location"       = "East Europe"
    "resource_group" = "ankit-rg2"
}
}

subnets = {
  "subnet1" = {
    "name"                 = "frontend_subnet"
    "address_prefixes"     = ["10.0.1.0/24"]
    "resource_group_name"  = "ankit-rg"
    "virtual_network_name" = "vnet1"
  }
  "subnet2" = {
    "name"                 = "backend_subnet"
    "address_prefixes"     = ["10.0.2.0/24"]
    "resource_group_name"  = "ankit-rg"
    "virtual_network_name" = "vnet1"
  }
}

public_ipss = {
  "frontend" = {
    "name"                = "frontend_public_ip"
    "location"            = "East Asia"
    "resource_group_name" = "ankit-rg"
    "allocation_method"   = "Static"
  }
  "backend" = {
    "name"                = "backend_public_ip"
    "location"            = "East Asia"
    "resource_group_name" = "ankit-rg"
    "allocation_method"   = "Static"
  }
}

nic_map = {
  "frontend" = {
    name                = "frontend_nic"
    location            = "East Asia"
    resource_group_name = "ankit-rg"
    subnet_name         = "frontend_subnet"
    vnet_name           = "vnet1"
    subnet_rg           = "ankit-rg"
    pub_ip_name         = "frontend_public_ip"
    nsg_name            = "frontend_nsg"
  }
  "backend" = {
    name                = "backend_nic"
    location            = "East Asia"
    resource_group_name = "ankit-rg"
    subnet_name         = "backend_subnet"
    vnet_name           = "vnet1"
    subnet_rg           = "ankit-rg"
    pub_ip_name         = "backend_public_ip"
    nsg_name            = "backend_nsg"
  }
}

virtual_machine = {
  "frontend" = {
    name                = "frontend-vm"
    resource_group_name = "ankit-rg"
    location            = "East Asia"
    size                = "Standard_B1s"
    admin_username      = "frontendvm"
    admin_password      = "Devpsinsider1"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-gen2"
      version   = "latest"
    }
  }
  "backend" = {
    name                = "backend-vm"
    resource_group_name = "ankit-rg"
    location            = "East Asia"
    size                = "Standard_B1s"
    admin_username      = "backendvm"
    admin_password      = "Devopsinsider2"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}

network_security_group = {
  frontend = {
    name                = "frontend_nsg"
    location            = "East Asia"
    resource_group_name = "ankit-rg"
    security_rules = [
      {
        name                       = "AllowHTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "22"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  backend = {
    name                = "backend_nsg"
    location            = "East Asia"
    resource_group_name = "ankit-rg"
    security_rules = [
      {
        name                       = "AllowSSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_ranges    = ["22","80","8000"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

sql_server = {
  "sqlserver1" = {
    name                         = "ankit-sql-server"
    resource_group_name          = "ankit-rg"
    location                     = "East Asia"
    version                      = "12.0"
    administrator_login          = "ag-admin"
    administrator_login_password = "Devops@1234"
  }
}

sql_database = {
  "sqldb1" = {
    name                = "ankit-sql-db"
    resource_group_name = "ankit-rg"
    location            = "East Asia"
    server_name         = "ankit-sql-server"
  }
}

key_vaults = {
  "keyvault1" = {
    name                        = "ankit-key-vault"
    location                    = "East Asia"
    resource_group_name         = "ankit-rg"
  }
}