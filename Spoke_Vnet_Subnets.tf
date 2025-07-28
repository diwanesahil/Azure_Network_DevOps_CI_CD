# create web subnet
/*resource "azurerm_subnet" "Web_Subnet" {
    name                 = var.Web_Subnet_Name
    resource_group_name  = azurerm_resource_group.Network_RG.name
    virtual_network_name = azurerm_virtual_network.Spoke_Vnet.name
    address_prefixes     = ["10.2.0.0/24"]
}

# create app subnet
resource "azurerm_subnet" "App_Subnet" {
    name                 = var.App_Subnet_Name
    resource_group_name  = azurerm_resource_group.Network_RG.name
    virtual_network_name = azurerm_virtual_network.Spoke_Vnet.name
    address_prefixes     = ["10.2.1.0/24"]
}

# create database subnet
resource "azurerm_subnet" "DB_Subnet" {
    name                 = var.DB_Subnet_Name
    resource_group_name  = azurerm_resource_group.Network_RG.name
    virtual_network_name = azurerm_virtual_network.Spoke_Vnet.name
    address_prefixes     = ["10.2.2.0/24"]
}*/