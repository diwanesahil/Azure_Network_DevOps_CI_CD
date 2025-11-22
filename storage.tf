# Create Storage Account
resource "azurerm_storage_account" "StorageAccount" {
  name                     = "storage21548798568547"
  resource_group_name      = azurerm_resource_group.Network_RG.name
  location                 = azurerm_resource_group.Network_RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = false
  
  
}

# Create Private Endpoint for Storage Account
resource "azurerm_private_endpoint" "StorageAccount_Private_Endpoint" {
  name                = "StorageAccountPrivateEndpoint"
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  subnet_id          = azurerm_subnet.Web_Subnet.id
   

  private_service_connection {
    name                           = "StorageAccountConnection"
    private_connection_resource_id = azurerm_storage_account.StorageAccount.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
        
  }
 
  }

# Create Private DNS Zone for Storage Account
resource "azurerm_private_dns_zone" "StorageAccount_Private_DNS" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.Network_RG.name
}

# Create Private DNS Zone Group
resource "azurerm_private_dns_zone_group" "StorageAccount_DNS_Zone_Group" {
  name                 = "StorageAccountDNSZoneGroup"
    private_dns_zone_ids = [
    azurerm_private_dns_zone.StorageAccount_Private_DNS.id,
  ]
}

# Create Private DNS Zone Virtual Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "StorageAccount_DNS_VNet_Link" {
  name                  = "StorageAccountDNSVNetLink"
  resource_group_name   = azurerm_resource_group.Network_RG.name
  private_dns_zone_name = azurerm_private_dns_zone.StorageAccount_Private_DNS.name
  virtual_network_id    = azurerm_virtual_network.Spoke_Vnet.id
  registration_enabled  = false
}