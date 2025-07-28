#create resource group
    resource "azurerm_resource_group" "Network_RG" {
      name     = "var.resource_group_name"
      location = "var.resource_group_location"
       }
