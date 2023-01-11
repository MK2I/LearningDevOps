
resource "azurerm_linux_virtual_machine" "vm"{
    name = "bookvm"
    location = "West Europe"
    resources_group_name = azurerm_resource_group.resources_group_name
    vm_size = "Standard_DS1_v2"
    network_interface_ids = ["${azurerm_network_interface.nic.id}"]
    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "latest"
    }
}