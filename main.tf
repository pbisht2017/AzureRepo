# PROVIDER
provider "azurerm" {
  version = "2.32.0"

subscription_id = "3caab25b-163a-4864-8816-20f9af09d1a0"
skip_provider_registration = true
  
  features {}
}

resource "azurerm_resource_group" "example" {
    name = "dockerRG"
    location = "East US"

    tags = {
      "Environment" = "production"
    }
  
}
