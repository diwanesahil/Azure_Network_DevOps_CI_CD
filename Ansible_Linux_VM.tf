# create network interface for Linux VM
/*resource "azurerm_network_interface" "Linux_VM_NIC" {
  name                = var.linux_vm_nic_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Web_Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Linux_VM_Public_IP.id
  }
}

# create public IP for Linux VM
resource "azurerm_public_ip" "Linux_VM_Public_IP" {
  name                = var.linux_vm_public_ip_name
  location            = azurerm_resource_group.Network_RG.location
  resource_group_name = azurerm_resource_group.Network_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# create Linux VM
resource "azurerm_linux_virtual_machine" "Linux_VM" {
  name                = var.linux_vm_name
  resource_group_name = azurerm_resource_group.Network_RG.name
  location            = azurerm_resource_group.Network_RG.location
  size                = "Standard_D2s_v3"
  admin_username      = var.linux_vm_admin_username
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.Linux_VM_NIC.id,
  ]

admin_ssh_key {
    username   = var.linux_vm_admin_username
    public_key = var.linux_vm_admin_password  # Assuming this is a public SSH key, not a password
}
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}*/