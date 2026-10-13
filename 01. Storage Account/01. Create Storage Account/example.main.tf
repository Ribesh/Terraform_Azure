/*
This Terraform configuration creates an Azure Virtual Network (VNet), a subnet inside that network, and a Storage Account with network restrictions. The key concept is that the subnet defines which private IP addresses your resources can use, service endpoints identify the subnet to Azure services, and storage account network rules determine which networks can access the storage account.
*/

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.8.0"
    }
  }
  required_version = ">=1.9.0"
}

resource "azurerm_resource_group" "rg_1" {
    name = "ribesh-resource-group"
    location = "Central India"
}


resource "azurerm_virtual_network" "vn_1" {
  name = "ribesh-vn"
  address_space = [ "10.0.0.0/16" ] # defines the address range available to your virtual network.
  resource_group_name = azurerm_resource_group.rg_1.name
  location = azurerm_resource_group.rg_1.location
}

resource "azurerm_subnet" "subnet_1" {
  name = "ribesh-subnet1"
  virtual_network_name = azurerm_virtual_network.vn_1.name
  resource_group_name = azurerm_resource_group.rg_1.name
  address_prefixes = [ "10.0.2.0/24" ] # allocates a smaller IP range within the existing VNet.
  service_endpoints = [ "Microsoft.Sql" , "Microsoft.Storage" ] # enables a subnet to connect directly to supported Azure services over the Azure backbone network
}

resource "azurerm_storage_account" "storage_account" {
  name = "ribesh-storage-account"
  resource_group_name = azurerm_resource_group.rg_1.name
  location = azurerm_resource_group.rg_1.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    ip_rules = [ "100.0.0.1" ] # allows requests from the specified public IPv4 address
    virtual_network_subnet_ids = [azurerm_subnet.subnet_1.id] # allow traffic from the specified subnet
  }

  tags = {
    environment = "staging"
  }
}

