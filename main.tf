# Utilvo EdgeShield v1.1.0 — Terraform Cloudflare WAF Module
# Official Rule Builder & Documentation: https://utilvo.com/edge-shield
# Live CIDR Threat Feed: https://utilvo.com/api/edge-shield/threats

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0.0"
    }
  }
}

variable "zone_id" {
  type        = string
  description = "Cloudflare Zone ID to protect with Utilvo EdgeShield WAF rules"
}

resource "cloudflare_ruleset" "utilvo_edge_shield_waf" {
  zone_id     = var.zone_id
  name        = "Utilvo EdgeShield Cloud Scraper & Bot Defense"
  description = "Blocks rotating-IP headless scrapers on AS132203, AS45102, AS136907 while whitelisting verified search engine crawlers (https://utilvo.com/edge-shield)"
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(ip.geoip.asnum in {132203 45102 136907 139902} and not cf.client.bot and not http.user_agent contains \"Googlebot\" and not http.user_agent contains \"bingbot\" and not http.user_agent contains \"Applebot\" and not http.user_agent contains \"DuckDuckBot\")"
    description = "Utilvo EdgeShield v1.1.0 — Drop Headless Cloud Datacenter Scrapers (100% SEO Safe)"
    enabled     = true
  }
}
