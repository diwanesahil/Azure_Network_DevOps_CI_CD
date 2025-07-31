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
resource "azurerm_firewall_policy" "Azure_Firewall_Policy" {
    name                = "AzureFirewallPolicy"
    location            = azurerm_resource_group.Network_RG.location
    resource_group_name = azurerm_resource_group.Network_RG.name

   }


resource "azurerm_firewall_policy_rule_collection_group" "DefaultApplicationRuleCollectionGroup" {
  name               = "DefaultApplicationRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.Azure_Firewall_Policy.id
  priority           = 100
  
  application_rule_collection {
    name     = "app_rule_collection1"
    priority = 500
    action   = "Deny"
    rule {
      name = "Deny_microsoft"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["10.2.0.4"]
      destination_fqdns = ["*.microsoft.com"]
    }
  }
}
   
 #create NAT rule collection group
resource "azurerm_firewall_policy_rule_collection_group" "DefaultNatRuleCollectionGroup" {
  name               = "DefaultNatRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.Azure_Firewall_Policy.id
  priority           = 200  
nat_rule_collection {
    name     = "nat_rule_collection1"
    priority = 300
    action   = "Dnat"
    rule {
      name                = "nat_rule_collection1_rule1"
      protocols           = ["TCP", "UDP"]
      source_addresses    = ["*"]
      destination_address = "172.191.135.131"
      destination_ports   = ["3389"]
      translated_address  = "10.2.0.4"
      translated_port     = "3389"
    }
  }
}