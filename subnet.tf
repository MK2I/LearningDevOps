resource "azurerm_subnet" "subnet"{
  name = "dbsubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = ["10.0.0.0/24"]
}