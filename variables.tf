variable "resource_group_name" {
  #description = "The name of the Resource Group that we want to attach"
  default = "dockerRG"
}
variable "vn1environment_name_tag" {
   # description = "The name of the environment name to Tag"
    default = "HUB"
}
variable "vn2environment_name_tag" {
   # description = "The name of the environment name to Tag"
    default = "SPOKE"
}
variable "resource_group_location" {
  #description = "The name of the location that resource group created"
  default = "southeastasia"   
}
variable "virtual_network_name" {
  #description = "The name of the Virtual Network name"
  type = string
}
variable "virtual_network1_name" {
  #description = "The name of the Virtual Network name"
  type = string
}
variable "address_space" {
  #description = "Address space range for virtual network"
  type = list
}
variable "address_space_vnet2" {
  #description = "Address space range for virtual network"
  type = list
}
variable "address_prefix" {
  #description = "address space range for subnet"
  type = map
}
variable "address_prefixvnet2" {
  #description = "address space range for subnet"
  type = map
}

##------------------------------ SETUP JUMPHOST SERVER  ---------------------------------##


# Variable for Storage Image Reference
variable "jumphost_storage_image_reference" {
  description = "Specify Jumphost reference."
  default        = "/subscriptions/3caab25b-163a-4864-8816-20f9af09d1a0/resourceGroups/dockerRG/providers/Microsoft.Compute/galleries/win_serv_2016"
}

# Variable for VM Name
variable "vm_jumphost_name" {
  description = "Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

# Variable for VM NIC Name
variable "vm_jumphost_nicname" {
  description = "Specifies the name of the Virtual Machine NIC. Changing this forces a new resource to be created."
  type        = string
}

# Variable for Network Interface Card Private IP-Address Allocation
variable "vm_jumphost_pvtipaddr_allocation" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Static"
}

# Variable for Storage Operating System Disk Caching
variable "vm_jumphost_osdisk_caching" {
    description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
    type        = string
    default     = "ReadWrite" 
}

# Variable for Storage Operating System Disk Create Option
variable "vm_jumphost_osdisk_crtopt" {
    description = "Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage."
    type        = string
    default     = "FromImage" 
}

# Variable for Storage Operating System Disk Managed Type
variable "vm_jumphost_managedosdisk_type" {
    description = "Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS."
    type        = string
    default     = "StandardSSD_LRS" 
}

# Variable for Storage Operating System 
variable "vm_jumphost_osdisk_boottype" {
    description = "Specifies the Operating System on the OS Disk. Possible values are Linux and Windows."
    type        = string
}

# Variable for Storage Operating System Disk Size
variable "vm_jumphost_osdisk_size" {
    description = "Specifies the size of the OS Disk in gigabytes"
}

# Variable for Storage Operating System Data Disk Size
variable "vm_jumphost_ddisk_0_size" {
    type        = string
    description = "Specifies the size of the Data Disk 0 in gigabytes"
    default     = "20"
}

# Variable for Storage Operating System Data Disk Type
variable "vm_jumphost_managedddisk_0_type" {
    type        = string
    description = "Specifies the Type of the Data Disk 0"
    default     = "StandardSSD_LRS"
}

# Variable for Virtual Machine Size 
variable "vm_jumphost_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
}

# Variable for Virtual Machine Host Admin name
variable "vm_jumphost_hostadmin_name" {
  description = "Specifies the name of the local administrator account."
  type        = string
}

# Variable for Virtual Machine Host Admin Password
variable "vm_jumphost_hostadmin_pwd" {
  description = "The password associated with the local administrator account."
  type        = string
}

# Variable for Application Service Name Tag
variable "vm_jumphost_nametag" {
    description = "Please enter the Service Tag Name" 
}

# Variable for Application Service NIC Name Tag
variable "vm_jumphost_nicnametag" {
    description = "Please enter the NIC Service Tag Name" 
}
