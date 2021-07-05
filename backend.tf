terraform {
  backend "azurerm" {
      resource_group_name = "dockerRG"
      storage_account_name = "terrastorage2289"
      container_name = "development"
      key = "development.tfstate"
      access_key = "8Gutdl7HnjfhgaFYqY5wiRb8GZphQK0ltcBo7f5qBjOrUzTZoUX/6cxqiyhsQ/4j9/lHVqCgOFLtlleXibHeRw=="
    
  }
}