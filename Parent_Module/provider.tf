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
  subscription_id = "e088c65c-826b-4b26-8075-ab650aa85523"
}
