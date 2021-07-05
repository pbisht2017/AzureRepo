variable "vnet_environment_name_tag" {
    description = ""
}
variable "virtual_network_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "virtual_network_address_space" {
  type = list
}
variable "subnet_address_prefix" {
  type = map
}

variable "dns_servers" {
  default = ["172.21.21.4","172.21.21.5"]
}