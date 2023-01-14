resource azurerm_resource_group "rg" {
    name = "dbrg"
    location = "West Europe"
    tags = {
        environment = "Terraform Azure"
    }
}