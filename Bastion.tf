# Create Bastion Host
resource "azurerm_bastion_host" "BastionHost" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  
  ip_configuration {
    name                 = "BastionHostIPConfig"
    subnet_id            = azurerm_subnet.AzureBastion_Subnet.id
    public_ip_address_id = azurerm_public_ip.Bastion_Public_IP.id
  }
}

# Create Public IP for Bastion Host
resource "azurerm_public_ip" "Bastion_Public_IP" {
  name                = "${var.bastion_host_name}-PublicIP"
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}