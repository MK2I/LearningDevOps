resource "azurerm_storage_account" "dbsac" {
  name = "dbsac"
  location = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}