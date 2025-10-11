terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
   backend "azurerm" {
     resource_group_name = "ankit-rg"
     storage_account_name  = "storeforblob1"
     container_name = "statefilestore"
     key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b35c9afa-9045-49a7-852b-e7bffe5ca332"
}
