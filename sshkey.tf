# create ssh key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# get the existing azure key vault
data "azurerm_key_vault" "existing_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.kv_resource_group_name
}

# store the ssh public key in the key vault
resource "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "sshPublicKey"
  value        = tls_private_key.ssh_key.public_key_openssh
  key_vault_id = data.azurerm_key_vault.existing_key_vault.id
}

# store the ssh private key in the key vault
resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "sshPrivateKey"
  value        = tls_private_key.ssh_key.private_key_pem
  key_vault_id = data.azurerm_key_vault.existing_key_vault.id    

}