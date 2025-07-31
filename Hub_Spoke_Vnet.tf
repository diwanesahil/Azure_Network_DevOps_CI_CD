# create Hub and Spoke VNet
resource "azurerm_virtual_network" "Hub_Vnet" {
  name                = var.hub_vnet_name
  resource_group_name = azurerm_resource_group.Network_RG.name
  location            = azurerm_resource_group.Network_RG.location
  address_space       = ["10.0.0.0/16"]
  depends_on = [ azurerm_resource_group.Network_RG ]
}

  resource "azurerm_virtual_network" "Spoke_Vnet" {
    name                = var.spoke_vnet_name
    resource_group_name = azurerm_resource_group.Network_RG.name
    location            = azurerm_resource_group.Network_RG.location
    address_space       = ["10.2.0.0/16"]
  }

  #create Hub and Spoke VNet peering
  resource "azurerm_virtual_network_peering" "Hub_to_Spoke" {
    name                      = var.Hub_to_Spoke_peering_name
    resource_group_name       = azurerm_resource_group.Network_RG.name
    virtual_network_name      = azurerm_virtual_network.Hub_Vnet.name
    remote_virtual_network_id = azurerm_virtual_network.Spoke_Vnet.id
    allow_forwarded_traffic   = true
    #allow_gateway_transit     = true
    use_remote_gateways       = false
    allow_virtual_network_access = true
  }

resource "azurerm_virtual_network_peering" "Spoke_to_Hub" {
    name                      = var.Spoke_to_Hub_peering_name
    resource_group_name       = azurerm_resource_group.Network_RG.name
    virtual_network_name      = azurerm_virtual_network.Spoke_Vnet.name
    remote_virtual_network_id = azurerm_virtual_network.Hub_Vnet.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    #use_remote_gateways       = true
    allow_virtual_network_access = true
}