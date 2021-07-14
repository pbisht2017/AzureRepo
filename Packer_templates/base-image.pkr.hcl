source "azure-arm" "base-image" {
  client_id           = "7c4b3ac5-cacc-4791-bd51-4fc1ff3baa3a"
  client_secret       = "EXE_OX6yi0w2Cw4-9-r.th5XV5SlT_UIMU"
  resource_group_name = "Terraform-deploy"
  storage_account     = "terrastorage2376"
  subscription_id     = "3caab25b-163a-4864-8816-20f9af09d1a0"
  tenant_id           = "c5ed1c03-8dc8-4e79-822c-529139a7f3ce"

  capture_container_name = "development"
  capture_name_prefix    = "packer"

  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "UbuntuServer"
  image_sku       = "18.04-LTS"

  azure_tags = {
    dept = "engineering"
  }

  location = "Southeastasia"
  vm_size  = "Standard_D2ds_v4"
}

build {
  sources = ["sources.azure-arm.base-image"]
}