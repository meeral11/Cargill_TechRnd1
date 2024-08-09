variable "subscription_id" {
    type = string
    description = "the name of the subscription id to be created"
    default = ""
  
}

variable "client_id" {
    type = string
    description = "the name of the client id to be created"
    default = ""
  
}

variable "client_secret" {
    type = string
    description = "the name of the client secret to be created"
    default = ""
  
}

variable "tenant_id" {
    type = string
    description = "the name of the tenant id to be created"
    default = ""
}

variable "location" {
    type = string
    description = "the name of the location to be created"
    default = ""
}

variable "resource_group_name" {
    type = string
    description = "the name of the resource group to be created"
    default = ""
}
