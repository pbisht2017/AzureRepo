  data "azurerm_resource_group" "image"{
    name = "dockerRG"
  }

  data "azurerm_image" "image" {
     name = "customLinux-2021-05-22-229"
     resource_group_name = data.azurerm_resource_group.image.name
}

data "azurerm_key_vault_secret" "mySecret" {
name = "apadmin"
key_vault_id = "/subscriptions/3caab25b-163a-4864-8816-20f9af09d1a0/resourceGroups/dockerRG/providers/Microsoft.KeyVault/vaults/vault-docker12"
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.armvm_name
  location              = var.armvm_location
  resource_group_name   = var.armvm_resgrp_name
  network_interface_ids = ["${azurerm_network_interface.vm-nic.id}"]
  vm_size               = var.armvm_size
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true



storage_image_reference {
  id = data.azurerm_image.image.id
}  

   os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "${var.armvm_name}-osdisk"
    caching           = var.vm_osdisk_caching
    create_option     = var.vm_osdisk_crtopt
    managed_disk_type = var.vm_managedosdisk_type
    os_type           = var.vm_osdisk_boottype
    disk_size_gb      = var.vm_osdisk_size
  }
  
  storage_data_disk {
    name              = "${var.armvm_name}-datadisk"
    lun               = "0"
    create_option     = "Empty"
    disk_size_gb      = var.vm_ddisk_0_size
    managed_disk_type = var.vm_managedddisk_0_type

  }

  os_profile {
    computer_name  = var.armvm_hostname
    admin_username = "apadmin"
    admin_password = "${data.azurerm_key_vault_secret.mySecret.value}"
  }
  
  tags = {
      Environment = var.armvm_name_tag 
    }

}
#-----------NIC---------------------------------- 


resource "azurerm_public_ip" "vm-nic-pip" {
  name                = var.armvm_name
  resource_group_name = var.armvm_resgrp_name
  location            = var.armvm_location
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    Environment = var.armvm_nicname_tag 
  }

}

resource "azurerm_network_interface" "vm-nic" {
  name                = var.armvm_name
  location            = var.armvm_location
  resource_group_name = var.armvm_resgrp_name

  ip_configuration {
    name                          = var.armvm_nic_name
    subnet_id                     = var.armvm_subnetid
    private_ip_address_allocation = var.armvm_pvtipaddr_alloc
    public_ip_address_id          = azurerm_public_ip.vm-nic-pip.id
    
  }

  tags = {
      Environment        = var.armvm_nicname_tag 
    }
}
