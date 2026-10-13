/*
Resource Group ->  Storage Account -> Storage Container -> Storage Blob
*/

resource "azurerm_resource_group" "rg_1" {
    name = "ribesh-rg"
    location = "Central India"
}

resource "azurerm_storage_account" "sc" {
  name = "ribesh-sc"
  resource_group_name = azurerm_resource_group.rg_1.name
  location = azurerm_resource_group.rg_1.location
  account_replication_type = "LRS"
  account_tier = "Standard"
}

resource "azurerm_storage_container" "example" {
  name = "content"
  storage_account_id = azurerm_storage_account.sc.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name = "my-awesome-content.zip" # New name for the uploaded file
  storage_container_id = azurerm_storage_container.example.id
  type = "Block"
  source = "some-local-file.zip" # Local file which is going to be uploaded
}