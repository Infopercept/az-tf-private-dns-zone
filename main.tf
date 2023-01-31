resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = length(var.private_dns_zone_names)
  name                = (var.private_dns_zone_names)[count.index]
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  count                 = length(var.private_dns_zone_names)
  name                  = "test"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = (var.private_dns_zone_names)[count.index]
  virtual_network_id    = var.virtual_network_id

  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]
}
