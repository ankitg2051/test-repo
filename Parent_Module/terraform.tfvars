resource_group = {
  "rg1" = {
    "name"     = "ankit-rg1"
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
}
