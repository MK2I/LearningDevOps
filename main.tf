resource "azurerm_resource_group" "rg" {
  name    = "bookRg"
  locaton = "West Europe"
  tags {
    environment = "Terraform Azure"
  }
}