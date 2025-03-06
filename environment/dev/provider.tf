terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.16.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "363ff287-347f-4c7a-8478-880a21142da6"

}