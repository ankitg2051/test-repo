terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "ankit-rg"
  #   storage_account_name  = "storeforblob1"
  #   container_name = "statefilestore"
  #   key = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "9c2d44b8-0b58-4481-8de2-41223a92f641"
}