terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "07fba9c5-f9fe-46d8-becc-50307a4f1ed7"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-3"
  location = "westeurope"
}