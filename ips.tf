resource "azurerm_public_ip" "pip" {
 name = "dbip"
 location = "West Europe"
 resource_group_name = "${azurerm_resource_group.rg.name}"
 domain_name_label = "dbip" 
 allocation_method = "Dynamic"
}