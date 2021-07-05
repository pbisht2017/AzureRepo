# PROVIDER
provider "azurerm" {
  version = "2.32.0"

subscription_id = "3caab25b-163a-4864-8816-20f9af09d1a0"
client_id       = "c577b289-d737-4707-a4e0-36b4f8fe3682"
client_secret   = "8SCAGmSkxk~6VhD2bk7-G9ajq9w._xROZ6"
tenant_id       = "c5ed1c03-8dc8-4e79-822c-529139a7f3ce" 

  features {}
}

resource "azurerm_resource_group" "example" {
    name = "dockerRG"
    location = "East US"

    tags = {
      "Environment" = "production"
    }
  
}
