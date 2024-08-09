output "subnet_name" {
    value = azurerm_subnet.subnet.id
  
}

output "vm_name" {
    value = azurerm_linux_virtual_machine.DemoSession.name
  
}

output "load_balancer_name" {
    value = azurerm_lb.lb.name
  
}

output "public_ip" {
    value = azurerm_public_ip.public_ip.ip_address
  
}