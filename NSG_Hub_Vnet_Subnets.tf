#create web subnet nsg
resource "azurerm_network_security_group" "Web_Subnet_NSG" {
  name                = var.web_subnet_nsg_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name


}
# attach web subnet nsg to web subnet
resource "azurerm_subnet_network_security_group_association" "Web_Subnet_NSG_Association" {
  subnet_id                 = azurerm_subnet.Web_Subnet.id
  network_security_group_id = azurerm_network_security_group.Web_Subnet_NSG.id
}

# create app subnet nsg
resource "azurerm_network_security_group" "App_Subnet_NSG" {
  name                = var.app_subnet_nsg_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name

}

# attach app subnet nsg to app subnet
resource "azurerm_subnet_network_security_group_association" "App_Subnet_NSG_Association" {
  subnet_id                 = azurerm_subnet.App_Subnet.id
  network_security_group_id = azurerm_network_security_group.App_Subnet_NSG.id
}

# create database subnet nsg
resource "azurerm_network_security_group" "Database_Subnet_NSG" {
  name                = var.database_subnet_nsg_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name

}

# attach database subnet nsg to database subnet
resource "azurerm_subnet_network_security_group_association" "Database_Subnet_NSG_Association" {
  subnet_id                 = azurerm_subnet.DB_Subnet.id
  network_security_group_id = azurerm_network_security_group.Database_Subnet_NSG.id
}