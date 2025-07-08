terraform {
  backend "azurerm" {
    resource_group_name   = "Lokesh-RSG"
    storage_account_name  = "lokeshstorageacr2"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
  }
}
