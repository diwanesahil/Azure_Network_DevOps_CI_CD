# create Application Gateway
resource "azurerm_application_gateway" "App_Gateway" {
  name                = var.app_gateway_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  
  gateway_ip_configuration {
    name      = "app-gateway-ipconfig"
    subnet_id = azurerm_subnet.AppGateway_Subnet.id
  }

  frontend_port {
    name = "app-gateway-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "app-gateway-frontend-ip"
    public_ip_address_id = azurerm_public_ip.AppGateway_Public_IP.id
  }

  backend_address_pool {
    name = "app-gateway-backend-pool"
  }

  backend_http_settings {
    name                  = "app-gateway-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

  http_listener {
    name                           = "app-gateway-http-listener"
    frontend_ip_configuration_name = "app-gateway-frontend-ip"
    frontend_port_name             = "app-gateway-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "app-gateway-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "app-gateway-http-listener"
    backend_address_pool_name  = "app-gateway-backend-pool"
    backend_http_settings_name = "app-gateway-backend-http-settings"
  }
}