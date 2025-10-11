resource_group = {
  "rg1" = {
    "name"     = "ankit-rg5"
    "location" = "East Asia"
  }
}
storage = {
  "store1" = {
    "name"                     = "storeforblob1"
    "location"                 = "East Asia"
    "resource_group"           = "ankit-rg5"
    "account_tier"             = "Standard"
    "account_replication_type" = "LRS"
  }
}

vn = {
  "vnet1" = {
    "name"           = "vnet1"
    "address_space"  = ["10.0.0.0/16"]
    "location"       = "East Asia"
    "resource_group" = "ankit-rg5"
  }
}
