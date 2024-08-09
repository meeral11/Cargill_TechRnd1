# Define the azure provider
provider "azurerm" {
  features {}
}

# Retreive Azure VNet Configuration

resource "azurerm_virtual_network" "vnet" {
  name = "myVnet"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.resource_group_name
}
 
 resource "azurerm_subnet" "subnet" {
    name = "mySubnet"
    resource_group_name = var.resource_group_name   
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
 }

 resource "azurerm_network_interface" "nic" {
    name = "myNic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "myNicConfiguration"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }

 }

# Retreieve Azure VM Configuration
resource "azurerm_linux_virtual_machine" "DemoSession" {
    name = "myDemoSession"
    location = var.location
    resource_group_name = var.resource_group_name
    size = "Standard_D2as_v4"
    admin_username = "cargiltech"
    admin_password = "cargil@123"
    
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  
    network_interface_ids = [
        azurerm_network_interface.nic.id,
    ]
    
  os_disk {
    name                 = "disk-1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# Retreive Load Balancer Configuration

resource "azurerm_lb" "lb" {
    name = "cargillLoadBalancer"
    location = var.location
    resource_group_name = var.resource_group_name

#     fronted_ip_configuration {
#         name = "PublicIPAddress"
#         public_ip_address_id = azurerm_public_ip.public_ip.id
#     }
}
resource "azurerm_public_ip" "public_ip" {
    name = "myPublicIP"
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = "Static"
  
}