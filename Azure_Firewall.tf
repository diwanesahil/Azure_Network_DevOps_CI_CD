# create Azure Firewall

resource "azurerm_firewall" "Azure_Firewall" {
    name                = var.azure_firewall_name
    location            = azurerm_resource_group.Network_RG.location
    resource_group_name = azurerm_resource_group.Network_RG.name
    sku_name            = "AZFW_VNet"
    sku_tier = "Standard"
    firewall_policy_id = azurerm_firewall_policy.Azure_Firewall_Policy.id
    
    ip_configuration {
        name                 = "configuration"
        subnet_id            = azurerm_subnet.AzureFirewall_Subnet.id
        public_ip_address_id = azurerm_public_ip.Azure_Firewall_Public_IP.id
    }
        
}

# create public IP for Azure Firewall
resource "azurerm_public_ip" "Azure_Firewall_Public_IP" {
    name                = var.azure_firewall_public_ip_name
    location            = azurerm_resource_group.Network_RG.location
    resource_group_name = azurerm_resource_group.Network_RG.name
    allocation_method   = "Static"
    sku                 = "Standard"
}

# create Azure Firewall Policy
/*resource "azurerm_firewall_policy" "Azure_Firewall_Policy" {
    name                = "AzureFirewallPolicy"
    location            = azurerm_resource_group.Network_RG.location
    resource_group_name = azurerm_resource_group.Network_RG.name
   }*/
   