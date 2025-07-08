provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "sql_server" {
  source              = "./modules/sql_server"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  sql_server_name     = var.sql_server_name
}

module "sql_database" {
  source              = "./modules/sql_database"
  resource_group_name = var.resource_group_name
  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
}

module "linux_vm" {
  source              = "./modules/linux_vm"
  count               = 2
  resource_group_name = var.resource_group_name
  location            = var.location
  prefix              = var.prefix
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  admin_password      = var.admin_password
}
