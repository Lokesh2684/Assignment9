data "azurerm_mssql_server" "main" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_database" "main" {
  name                = var.sql_database_name
  server_id           = data.azurerm_mssql_server.main.id
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"
}
