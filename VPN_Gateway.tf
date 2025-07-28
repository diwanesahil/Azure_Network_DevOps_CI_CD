# create VPN Gateway
resource "azurerm_virtual_network_gateway" "VPN_Gateway" {
  name                = var.vpn_gateway_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"

  ip_configuration {
    name                          = "vpngateway-ipconfig"
    subnet_id                     = azurerm_subnet.VPN_Gateway_Subnet.id
    public_ip_address_id          = azurerm_public_ip.VPN_Public_IP.id
    private_ip_address_allocation = "Dynamic"
  }
  
}

# create public IP for VPN Gateway
resource "azurerm_public_ip" "VPN_Public_IP" {
  name                = var.vpn_public_ip_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
    }