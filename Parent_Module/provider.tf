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
  subscription_id = "8047b6da-5aca-4a1b-a741-1c075ee56791"
}
