# Terraform Configurations
terraform {
  required_providers {
    azurerm = {
        source = "azurerm"
        version = "~>3.61.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "Cargil_Session"
    
  }
}