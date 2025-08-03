variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  
}

variable "resource_group_location" {
  description = "The Azure region where the resource group will be located."
  type        = string
    
}

variable "hub_vnet_name" {
  description = "The name of the Hub Virtual Network."
  type        = string
    
}

variable "spoke_vnet_name" {
  description = "The name of the Spoke Virtual Network."
  type        = string
  
}
variable "Hub_to_Spoke_peering_name" {
  description = "The name of the Hub to Spoke VNet peering."
  type        = string
  
}

variable "Spoke_to_Hub_peering_name" {
  description = "The name of the Spoke to Hub VNet peering."
  type        = string
  
}

variable "Web_Subnet_Name" {
  description = "The name of the Web Subnet."
  type        = string
    
}

variable "App_Subnet_Name" {
  description = "The name of the App Subnet."
  type        = string
  
}

variable "DB_Subnet_Name" {
  description = "The name of the Database Subnet."
  type        = string  
  
}

variable "AppGateway_Subnet_Name" {
  description = "The name of the Application Gateway Subnet."
  type        = string
  
}

variable "AzureBastion_Subnet_Name" {
  description = "The name of the Azure Bastion Subnet."
  type        = string      
  
}

variable "VPN_Gateway_Subnet_Name" {
  description = "The name of the VPN Gateway Subnet."
  type        = string
  
}

variable "AzureFirewall_Subnet_Name" {
  description = "The name of the Azure Firewall Subnet."
  type        = string
  
}

variable "SharedServices_Subnet_Name" {
  description = "The name of the Shared Services Subnet."
  type        = string
  
}

variable "vpn_gateway_name" {
  description = "The name of the VPN Gateway."
  type        = string
  
}

variable "vpn_public_ip_name" {
  description = "The name of the Public IP for the VPN Gateway."
  type        = string
  
}

variable "azure_firewall_name" {
  description = "The name of the Azure Firewall."
  type        = string
  
}

variable "azure_firewall_public_ip_name" {
  description = "The name of the Public IP for the Azure Firewall."
  type        = string
  
}

variable "web_subnet_nsg_name" {
  description = "The name of the Network Security Group for the Web Subnet."
  type        = string
  
}

variable "app_subnet_nsg_name" {
  description = "The name of the Network Security Group for the App Subnet."
  type        = string
  
}
variable "database_subnet_nsg_name" {
  description = "The name of the Network Security Group for the Database Subnet."
  type        = string
  
}
variable "vm_admin_username" {
  description = "The administrator username for the virtual machines."
  type        = string
  
}
  
variable "vm_admin_password" {
  description = "The administrator password for the virtual machines."
  type        = string
  sensitive   = true
  
}
variable "app_gateway_name" {
  description = "The name of the Application Gateway."
  type        = string
  
}
variable "app_gateway_public_ip_name" {
  description = "The name of the Public IP for the Application Gateway."
  type        = string
  
}