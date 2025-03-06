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
  subscription_id = "8d22e716-6dc1-4fa1-822a-3cfaa4acfba0"

}