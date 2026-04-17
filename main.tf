terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }

}
provider "azurerm" {
  features {}
  subscription_id = "98174e88-da11-4352-adda-43babc341410"
}
resource "azurerm_resource_group" "group1" {
  name     = "terraform_rg"
  location = "Central India"

}
resource "azurerm_network_security_group" "secgr1" {
  name                = "terrarform_secgr1"
  location            = azurerm_resource_group.group1.location
  resource_group_name = azurerm_resource_group.group1.name
}
resource "azurerm_virtual_network" "vnet1" {
  name                = "terraform_vnet1"
  resource_group_name = azurerm_resource_group.group1.name
  location            = azurerm_resource_group.group1.location
  address_space       = ["10.0.0.0/29"]
  dns_servers         = ["10.0.0.0", "10.0.0.7"]

  subnet  {
    name             = "terraform_subnet1"
    address_prefixes = ["10.0.0.0/29"]
    security_group   = azurerm_network_security_group.secgr1.id
  }
}
#mai hoon ashwatthama
#mai hoon tom
# i am superman


# a new change made by harsh