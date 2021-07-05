output "vnet_id" {
  value = "${azurerm_virtual_network.virtual-network.*.id}"
  description = "The virtual NetworkConfiguration ID."
}
output "subnets_id" {
  value = "${azurerm_subnet.network-subnet.*.id}"
  description = "List The ID's of the associated subnets"
}

