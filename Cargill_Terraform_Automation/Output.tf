output "resource_group_name" {
    value = azurerm_resource_group.Cargil_Session.name
  
}

output "virtual_network_name" {
    value = azurerm_virtual_network.vnet.name
  
}

output "subnet_name" {
    value = azurerm_subnet.subnet.name
  
}

output "vm_name" {
    value = azurerm_windows_virtual_machine.DemoSession.name
  
}

output "load_balancer_name" {
    value = azurerm_lb.lb.name
  
}

output "public_ip" {
    value = azurerm_public_ip.public_ip.ip_address
  
}