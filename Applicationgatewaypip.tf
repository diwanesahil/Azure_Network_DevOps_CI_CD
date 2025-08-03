# create pip for Application Gateway
resource "azurerm_public_ip" "AppGateway_Public_IP" {
  name                = var.app_gateway_public_ip_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}