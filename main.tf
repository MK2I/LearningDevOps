#Terraform script to deploy Azure infrastracture windows



#Code that provides the /Resource group/


resource azurerm_resource_group "rg" {
    name = "bookRg"
    location = "West Europe"
    tags{
        environment = "Terraform Azure"
    }
}


#Code for the /Network/ in the /Resource group/


resource "azurerm_virtual_network" "vnet" {
    name = "book-vnet"
    location = "West Europe"
    address_space = [ "10.0.0.0/16" ]
    resource_group_name = azurerm_resource_group.rg.name
}


#Allocation of the network/


resource "azurerm_subnet" "subnet" {
  name = "book-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = [ "10.0.10.0/24" ]
}   


#Code for the interface inside the network and configuration of the IP


resource "azurerm_network_interface" "nic" {
    name = "book-nic"
    location = "West Europe"
    resource_group_name = azurerm_resource_group.rg.name
    ip_configuration {
      name = "bookipconfig"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip.id
    }
  
}


#Code for the public IP adress in subnet


resource "azurerm_public_ip" "pip" {
 name = "book-ip"
 location = "West Europe"
 resouresource_group_name = "${azurerm_resource_group.rg.name}"
 public_ip_address_allocation = "Dynamic"
 domain_domain_name_label = "bookdevops" 
}


#Code for the storage account for boot diagnostic logs


resource "azurerm_storage_account" "stor" {
  name = "bookstor"
  location = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}
