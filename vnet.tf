resource "azurerm_virtual_network" "vnet" {
  name = "db-vnet"
  location = "${azurerm_resource_group.rg.location}"
  address_space = [ "10.0.0.0/16" ]
  resource_group_name = azurerm_resource_group.rg.name
}