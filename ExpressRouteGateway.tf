# create ExpressRoute Gateway
/*resource "azurerm_express_route_gateway" "ExpressRoute_Gateway" {
  name                = var.express_route_gateway_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  virtual_hub_id = azurerm_virtual_network.Hub_Vnet.id
  scale_units = 1
 

}*/

resource "azurerm_virtual_network_gateway" "ExpressRoute_Gateway" {
  name                = var.express_route_gateway_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  type                = "ExpressRoute"
  sku                 = "Standard"

  ip_configuration {
    name                          = "expressroute-gateway-ipconfig"
    subnet_id                     = azurerm_subnet.VPN_Gateway_Subnet.id
    public_ip_address_id          = azurerm_public_ip.ExpressRoute_Public_IP.id
    private_ip_address_allocation = "Dynamic"
  }
  
}

# create public IP for ExpressRoute Gateway
resource "azurerm_public_ip" "ExpressRoute_Public_IP" {
  name                = var.express_route_public_ip_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}