terraform {
  backend "azurerm" {
    resource_group_name  = "dockerRG"
    storage_account_name = "terrastorage22894"
    container_name       = "development"
    key                  = "development.tfstate"
    access_key           = "0hQnIaC1IOG2CHfNmD0UEVCN7Z/aokQ1yAn78oP2VfPQhWv1dKzxMgENtq2TrJUqLbyaUDwfeCK1F9L6ah0zgA=="
  }
}