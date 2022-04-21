resource "azurerm_virtual_network" "az104net0" {
  name                = "az104-05-vnet0"
  address_space       = ["10.50.0.0/22"]
  location            = var.location
  resource_group_name = azurerm_resource_group.az104-05-rg1.name
}

resource "azurerm_virtual_network" "az104net1" {
  name                = "az104-05-vnet1"
  address_space       = ["10.51.0.0/22"]
  location            = var.location
  resource_group_name = azurerm_resource_group.az104-05-rg1.name
}

resource "azurerm_virtual_network" "az104net2" {
  name                = "az104-05-vnet2"
  address_space       = ["10.52.0.0/22"]
  location            = var.location2
  resource_group_name = azurerm_resource_group.az104-05-rg1.name
}
#########################
##    VNET PEERING 0-1 ##  
#########################

resource "azurerm_virtual_network_peering" "peer0to1" {
  name                      = "peer0to1"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net0.name
  remote_virtual_network_id = azurerm_virtual_network.az104net1.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer1to0"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net1.name
  remote_virtual_network_id = azurerm_virtual_network.az104net0.id
}

#########################
##    VNET PEERING 0-2 ##  
#########################

resource "azurerm_virtual_network_peering" "peer0to1" {
  name                      = "peer0to2"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net0.name
  remote_virtual_network_id = azurerm_virtual_network.az104net2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to0"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net2.name
  remote_virtual_network_id = azurerm_virtual_network.az104net0.id
}

#########################
##    VNET PEERING 1-2 ##  
#########################

resource "azurerm_virtual_network_peering" "peer0to1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net1.name
  remote_virtual_network_id = azurerm_virtual_network.az104net2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name      = azurerm_virtual_network.az104net2.name
  remote_virtual_network_id = azurerm_virtual_network.az104net1.id
}