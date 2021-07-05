provider "azurerm" {
  version = "2.32.0"

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
