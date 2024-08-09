# Define the azure provider
provider "azurerm" {
  features {}
}

# Resource group to be used
data "azurerm_resource_group" "Cargil_Session" {
  name = "Cargil_Session"
  location = var.eastus
}

# Retreive Client configuration
data "azurerm_client_config" "current" {
  
}

locals {
  current_user_id = coalesce(var.msi.id, data.azurerm_client_config.current.object_id)
}

# Retreive Azure VNet Configuration

resource "azurerm_virtual_network" "vnet" {
  name = "myVnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.Cargil_Session.location
  resource_group_name = azurerm_resource_group.Cargil_Session.name
}
 
 resource "azurerm_subnet" "subnet" {
    name = "mySubnet"
    resource_group_name = azurerm_resource_group.Cargil_Session.name   
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
 }

 resource "azurerm_network_interface" "nic" {
    name = "myNic"
    location = azurerm_resource_group.Cargil_Session.location
    resource_group_name = azurerm_resource_group.Cargil_Session.name

    ip_configuration {
        name = "myNicConfiguration"
        subnet_id = azurerm_subnet.subnet_id
        private_ip_address_allocation = "Dynamic"
    }

 }

# Retreieve Azure VM Configuration
resource "azurerm_windows_virtual_machine" "DemoSession" {
    name = "myDemoSession"
    location = azurerm_resource_group.Cargil_Session.location
    resource_group_name = azurerm_resource_group.Cargil_Session.name
    size = "standard_B2s"

    network_interface_ids = [
        azurerm_network_interface.nic.id,
    ]
  
}

# Retreive Load Balancer Configuration

resource "azurerm_lb" "lb" {
    name = "cargillLoadBalancer"
    location = azurerm_resource_group.Cargil_Session.location
    resource_group_name = azurerm_resource_group.Cargil_Session.name

    fronted_ip_configuration {
        name = "PublicIPAddress"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}
resource "azurerm_public_ip" "public_ip" {
    name = "myPublicIP"
    location = azurerm_resource_group.Cargil_Session.location
    resource_group_name = azurerm_resource_group.Cargil_Session.name
    allocation_method = "static"
  
}