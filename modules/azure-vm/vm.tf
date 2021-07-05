resource "azurerm_virtual_machine" "main" {
  name                  = var.armvm_name
  location              = var.armvm_location
  resource_group_name   = var.armvm_resgrp_name
  network_interface_ids = ["${azurerm_network_interface.vm-nic.id}"]
  vm_size               = var.armvm_size
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference
  }

  dynamic "os_profile_windows_config"{
      for_each = var.vm_os_profile_windows_config
      content {
          provision_vm_agent        = lookup(os_profile_windows_config.value, "provision_vm_agent", null)
          enable_automatic_upgrades = lookup(os_profile_windows_config.value, "enable_automatic_upgrades", null)
          timezone                  = lookup(os_profile_windows_config.value, "timezone", null)
      }
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
    admin_username = var.armvm_hostadmin_name
    admin_password = var.armvm_hostadmin_pwd
  }
  
  tags = {
      Environment        = var.armvm_name_tag 
    }
}

#-----------NIC---------------------------------- 

resource "azurerm_public_ip" "vm-nic-pip" {
  name                = var.armvm_name
  resource_group_name = var.armvm_resgrp_name
  location            = var.armvm_location
  allocation_method   = "Static"
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