# create ExpressRoute Gateway
resource "azurerm_express_route_gateway" "ExpressRoute_Gateway" {
  name                = var.express_route_gateway_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  virtual_hub_id = azurerm_virtual_network.Hub_Vnet.id
  scale_units = 1
 

}