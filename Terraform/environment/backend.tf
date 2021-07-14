terraform {
  backend "azurerm" {
      resource_group_name = "dockerRG"
      storage_account_name = "terrastorage2376"
      container_name = "development"
      key = "development.tfstate"
      access_key = "qAnlUOnSS2PT+fHrIeKazYvakE2tlBC5p1++UOuJh9Q/ZblYQqtJ1ovjKFlmSSFPsgdTogMM7nUm3yyqWkFB5Q=="
    
  }
}


/*
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Bisht-Demo"

    workspaces {
      name = "my-app"
    }
  }
}
*/