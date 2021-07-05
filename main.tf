# PROVIDER
provider "azurerm" {
  version = "2.32.0"

skip_provider_registration = true
  
  features {}
}

##-------------------VIRTUAL NETWORK SETUP WITH SUBNETS AND PEERING-----------------------##

module "vnet_module1" {
  source = "../modules/azure-vnet"
  virtual_network_name                = var.virtual_network_name
  virtual_network_address_space       = var.address_space
  resource_group_location             = var.resource_group_location
  resource_group_name                 = var.resource_group_name
  subnet_address_prefix               = var.address_prefix
  vnet_environment_name_tag           = var.vn1environment_name_tag
}
module "vnet_module2" {
  source = "../modules/azure-vnet"
  virtual_network_name                = var.virtual_network1_name
  virtual_network_address_space       = var.address_space_vnet2
  resource_group_location             = var.resource_group_location
  resource_group_name                 = var.resource_group_name
  subnet_address_prefix               = var.address_prefixvnet2
  vnet_environment_name_tag           = var.vn2environment_name_tag
}


##-----------------------Create Virtual Machine----------------------------------------------------##


module "jumphost" {
  source                            = "../modules/azure-vm"
  armvm_name                        = var.vm_jumphost_name 
  armvm_nic_name                    = var.vm_jumphost_nicname
  armvm_location                    = var.resource_group_location
  armvm_resgrp_name                 = var.resource_group_name
  armvm_size                        = var.vm_jumphost_size
  armvm_subnetid                    = module.vnet_module1.subnets_id[4]
  armvm_pvtipaddr_alloc             = var.vm_jumphost_pvtipaddr_allocation
  vm_osdisk_caching                 = var.vm_jumphost_osdisk_caching
  vm_osdisk_crtopt                  = var.vm_jumphost_osdisk_crtopt
  vm_managedosdisk_type             = var.vm_jumphost_managedosdisk_type
  vm_osdisk_boottype                = var.vm_jumphost_osdisk_boottype
  vm_osdisk_size                    = var.vm_jumphost_osdisk_size
  vm_ddisk_0_size                   = var.vm_jumphost_ddisk_0_size
  vm_managedddisk_0_type            = var.vm_jumphost_managedddisk_0_type
  armvm_hostname                    = var.vm_jumphost_name
  /*armvm_hostadmin_name              = var.vm_jumphost_hostadmin_name
  armvm_hostadmin_pwd               = var.vm_jumphost_hostadmin_pwd*/
  armvm_name_tag                    = var.vm_jumphost_nametag
  armvm_nicname_tag                 = var.vm_jumphost_nicnametag

}