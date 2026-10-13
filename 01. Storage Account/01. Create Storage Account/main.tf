resource "azurerm_resource_group" "rg_1" {
    name = "ribesh-resource-group"
    location = "Central India"
}

resource "azurerm_storage_account" "storage_account" {
  name = "ribesh-storage-account"
  resource_group_name = azurerm_resource_group.rg_1.name
  location = azurerm_resource_group.rg_1.location
  account_tier = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

