#create application gateway subnet
/*resource "azurerm_subnet" "AppGateway_Subnet" {
  name                 = var.AppGateway_Subnet_Name
  resource_group_name  = azurerm_resource_group.Network_RG.name
  virtual_network_name = azurerm_virtual_network.Hub_Vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# create Azure Bastion subnet
resource "azurerm_subnet" "AzureBastion_Subnet" {
  name                 = var.AzureBastion_Subnet_Name
  resource_group_name  = azurerm_resource_group.Network_RG.name
  virtual_network_name = azurerm_virtual_network.Hub_Vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# create Gateway subnet
resource "azurerm_subnet" "VPN_Gateway_Subnet" {
  name                 = var.VPN_Gateway_Subnet_Name
  resource_group_name  = azurerm_resource_group.Network_RG.name
  virtual_network_name = azurerm_virtual_network.Hub_Vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# create Azure Firewall subnet
resource "azurerm_subnet" "AzureFirewall_Subnet" {
  name                 = var.AzureFirewall_Subnet_Name
  resource_group_name  = azurerm_resource_group.Network_RG.name
  virtual_network_name = azurerm_virtual_network.Hub_Vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# create shared services subnet
resource "azurerm_subnet" "SharedServices_Subnet" {
  name                 = var.SharedServices_Subnet_Name
  resource_group_name  = azurerm_resource_group.Network_RG.name
  virtual_network_name = azurerm_virtual_network.Hub_Vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}*/