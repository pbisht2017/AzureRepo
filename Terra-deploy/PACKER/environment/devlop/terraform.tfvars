##------------------------Creating Virtual Network and Resource Group----------------##

virtual_network_name        = "NKFSINDVVN01"
virtual_network1_name       = "NKFSINDVVN02"
address_space               = ["172.21.0.0/16"]
address_space_vnet2         = ["172.22.0.0/16"]
address_prefix              = {

    "0" = ["ADDNS-Subnet", "172.21.21.0/24" ]
    "1" = ["Untrust-Subnet", "172.21.255.0/24" ]
    "2" = ["Trust-Subnet", "172.21.102.0/24" ]
    "3" = ["Management-Subnet", "172.21.15.0/24"]
    "4" = ["VDI-Subnet", "172.21.0.0/24"]
}
address_prefixvnet2         = {

    "0" = ["Web-subnet", "172.22.20.0/24" ]
    "1" = ["App-Subnet", "172.22.21.0/24" ]
    "2" = ["Database-Subnet", "172.22.22.0/24" ]
}



##----------------------- Create JUMPHOST SERVER -------------------------------------------##

vm_jumphost_name                = "NKFSINDEVJH"
vm_jumphost_nicname             = "NKFSINDEVJHNI01"
vm_jumphost_size                = "Standard_A4_v2"
vm_jumphost_managedosdisk_type  = "StandardSSD_LRS"
vm_jumphost_osdisk_boottype     = "Linux"
vm_jumphost_osdisk_size         = "127"
/*vm_jumphost_hostadmin_name      = "apadmin"
vm_jumphost_hostadmin_pwd       = "Thunder@1234"*/
vm_jumphost_nametag             = "NKFSINDEVJH"
vm_jumphost_nicnametag          = "NKFSINDEVJHNIC01"