# Create Storage Account
resource "azurerm_storage_account" "StorageAccount" {
  name                     = "windowsvmstorage215487"
  resource_group_name      = azurerm_resource_group.Network_RG.name
  location                 = azurerm_resource_group.Network_RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
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
    
  }
}