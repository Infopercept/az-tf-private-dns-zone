resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = length(var.private_dns_zone_names)
  name                = (var.private_dns_zone_names)[count.index]
  resource_group_name = var.resource_group_name
    tags = {
    Environment = "Dev"
    Purpose     = "testing"
  }
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

resource "azurerm_private_dns_a_record" "prdremarapp01" {
  name                = "prdremarapp01"
  zone_name           = "dm.ae"
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  records             = ["10.230.112.20"]
  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]
}
/*
resource "azurerm_private_dns_a_record" "stgapigw-vip" {
  name                = "stgapigw-vip"
  zone_name           = "dm.ae"
  resource_group_name = var.resource_group_name
  ttl                 = 36000
  records             = ["10.140.70.174"]
  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]
}*/

resource "azurerm_private_dns_a_record" "stgapigw-vip" {
    #fqdn                = "prdremarapp01.dm.ae."
    #id                  = "/subscriptions/9c6305ab-4484-4e63-9189-3ec249d383ae/resourceGroups/dm-it-iot-dev-connectivity-rg/providers/Microsoft.Network/privateDnsZones/dm.ae/A/prdremarapp01"
    name                = "prdremarapp01"
    records             = [
        "10.230.112.20",
    ]
    resource_group_name = "dm-it-iot-dev-connectivity-rg"
    tags                = {}
    ttl                 = 3600
    zone_name           = "dm.ae"

    timeouts {}
}

/*resource "azurerm_private_dns_a_record" "tstremarapp01" {
  name                = "tstremarapp01"
  zone_name           = "dm.ae"
  resource_group_name = var.resource_group_name
  ttl                 = 10800
  records             = ["10.255.51.21"]
  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]
}*/

resource "azurerm_private_dns_a_record" "tstremarapp01" {
    #fqdn                = "stgapigw-vip.dm.ae."
    #id                  = "/subscriptions/9c6305ab-4484-4e63-9189-3ec249d383ae/resourceGroups/dm-it-iot-dev-connectivity-rg/providers/Microsoft.Network/privateDnsZones/dm.ae/A/stgapigw-vip"
    name                = "stgapigw-vip"
    records             = [
        "10.140.70.174",
    ]
    resource_group_name = "dm-it-iot-dev-connectivity-rg"
    tags                = {}
    ttl                 = 36000
    zone_name           = "dm.ae"

    timeouts {}
}


/*
resource "azurerm_private_dns_a_record" "a_record_private_with_zone" {
  count               = var.create_dns_zone ? (var.public_dns_zone ? 0 : length(var.a_records)) : 0
  zone_name           = (var.private_dns_zone_names)[count.index]
  resource_group_name = var.resource_group_name

  name                = var.a_records[count.index].name
  records             = var.a_records[count.index].records
  ttl                 = var.a_records[count.index].ttl
  depends_on = [ azurerm_private_dns_zone.private_dns_zone ]
}*/
