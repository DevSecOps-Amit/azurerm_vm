resource "azurerm_public_ip" "pip" {
  name                = "tcsbublicip"
  resource_group_name = "rg-dev-tcs"
  location            = "centralindia"
  allocation_method   = "Static"

}

resource "azurerm_network_interface" "nic" {
  name                = "tcsnic"
  location            = "centralindia"
  resource_group_name = "rg-dev-tcs"

  ip_configuration {
    name                          = "tcsip"
    subnet_id                     = "/subscriptions/8d22e716-6dc1-4fa1-822a-3cfaa4acfba0/resourceGroups/rg-dev-tcs/providers/Microsoft.Network/virtualNetworks/tcs-vnet/subnets/tcs-subnet1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "tcs-vm"
  resource_group_name             = "rg-dev-tcs"
  location                        = "centralindia"
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "Tcs@1234"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}