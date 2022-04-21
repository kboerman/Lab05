resource "azurerm_subnet" "subnet50" {
  name                 = "subnet50"
  resource_group_name  = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name = azurerm_virtual_network.az104net0.name
  address_prefixes     = ["10.50.0.0/24"]
}

resource "azurerm_subnet" "subnet51" {
  name                 = "subnet51"
  resource_group_name  = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name = azurerm_virtual_network.az104net1.name
  address_prefixes     = ["10.51.0.0/24"]
}

resource "azurerm_subnet" "subnet52" {
  name                 = "subnet52"
  resource_group_name  = azurerm_resource_group.az104-05-rg1.name
  virtual_network_name = azurerm_virtual_network.az104net2.name
  address_prefixes     = ["10.52.0.0/24"]
}