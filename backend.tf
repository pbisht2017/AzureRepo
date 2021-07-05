terraform {
  backend "azurerm" {
      resource_group_name = "dockerRG"
      storage_account_name = "terrastorage22894"
      container_name = "development"
      key = "development.tfstate"
      access_key = "uhpPRiLi8IYyumt4w+ZsLsO0Oo9Jn+R8+Pfjp2Q957rBcabRy6i+FSygmoUJq4mzB32kNwKtoRMUGyevIgjtSg=="
    
  }
}