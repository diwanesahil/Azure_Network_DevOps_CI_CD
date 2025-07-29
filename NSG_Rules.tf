# create network security rule with port 80
resource "azurerm_network_security_rule" "Web_Subnet_HTTP_Rule" {
  name                        = "Allow-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.Web_Subnet_NSG.name
  resource_group_name         = azurerm_resource_group.Network_RG.name
}