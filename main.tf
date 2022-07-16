resource "azurerm_resource_group" "network" {
  name     = "ELITE-development-network-eastus2"
  location = "East US 2"
}

resource "azurerm_virtual_network" "virtualnetwork" {
  name                = "ELITE-development-virtualnetwork-eastus2"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "servers" {
  name                 = "servers"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  address_prefixes     = ["10.0.0.0/24"]
}
