#---------------------------
# DECLARING FIXED VARIABLES
#---------------------------

# Variable for Application Service Name Tag
variable "armvm_name_tag" {
    description = "Please enter the Service Tag Name" 
}

# Variable for Application Service NIC Name Tag
variable "armvm_nicname_tag" {
    description = "Please enter the NIC Service Tag Name" 
}

#---------------------------
# DECLARING NIC DETAILS
#---------------------------

# Variable for Network Interface Card Name
variable "armvm_name" {
  description = "Specifies the name of the Virtual Machine NIC. Changing this forces a new resource to be created."
  type        = string
}

# Variable for Network Interface Card Name
variable "armvm_nic_name" {
  description = "Specifies the name of the Virtual Machine NIC. Changing this forces a new resource to be created."
  type        = string
}

# Variable for Network Interface Card Name
variable "armvm_location" {
  description = "The location/region where the network interface is created. Changing this forces a new resource to be created."
  type        = string
}

# Variable for Network Interface Card Resource group Name
variable "armvm_resgrp_name" {
  description = "The name of the resource group in which to create the network interface. Changing this forces a new resource to be created."
  type        = string
  default     = "AutomationAnywhere"
}

# Variable for Network Interface Card ResourceGroup Subnet-ID
variable "armvm_subnetid" {
  description = "Reference to a subnet in which this NIC has been created. Required when private_ip_address_version is IPv4."
  type        = string
}

# Variable for Network Interface Card Private IP-Address Allocation
variable "armvm_pvtipaddr_alloc" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Static"
}

#-----------------------------------
# DECLARING VIRTUAL MACHINE DETAILS
#-----------------------------------

# Variable for Operating System Profile windows configuration 
variable "vm_os_profile_windows_config" {
  description = "A os_profile_windows_config block supports the following"
  type        = list(map(string))
  default     = [{
      "provision_vm_agent"              : "true"
      "enable_automatic_upgrades"       : "false"
      "timezone"                        : "Singapore Standard Time"
  }]
}

# Variable for Storage Operating System Disk Caching
variable "vm_osdisk_caching" {
    description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
    type        = string
    default     = "ReadWrite" 
}

# Variable for Storage Operating System Disk Create Option
variable "vm_osdisk_crtopt" {
    description = "Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage."
    type        = string
    default     = "FromImage" 
}

# Variable for Storage Operating System Disk Managed Type
variable "vm_managedosdisk_type" {
    description = "Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS."
    type        = string
    default     = "StandardSSD_LRS" 
}

# Variable for Storage Operating System 
variable "vm_osdisk_boottype" {
    description = "Specifies the Operating System on the OS Disk. Possible values are Linux and Windows."
    type        = string
}

# Variable for Storage Operating System Disk Size
variable "vm_osdisk_size" {
    description = "Specifies the size of the OS Disk in gigabytes"
}

# Variable for Storage Operating System Data Disk Size
variable "vm_ddisk_0_size" {
    type        = string
    description = "Specifies the size of the Data Disk 0 in gigabytes"
}

# Variable for Storage Operating System Data Disk Type
variable "vm_managedddisk_0_type" {
    type        = string
    description = "Specifies the Type of the Data Disk 0"
}

# Variable for Virtual Machine Size 
variable "armvm_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
  
}

# Variable for Virtual Machine Hostname 
variable "armvm_hostname" {
  description = "Specifies the name of the Virtual Machine."
  type        = string
}

# Variable for Virtual Machine Host Admin name
variable "armvm_hostadmin_name" {
  description = "Specifies the name of the local administrator account."
  type        = string
}

# Variable for Virtual Machine Host Admin Password
variable "armvm_hostadmin_pwd" {
  description = "The password associated with the local administrator account."
  type        = string
}


variable "public_ip_address_allocation" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "dynamic"
}

variable "nb_public_ip" {
  description = "Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses."
  default     = "1"
}


# Variable for Storage Image Reference
variable "storage_image_reference" {
  description = "It's a storage Image reference"
}