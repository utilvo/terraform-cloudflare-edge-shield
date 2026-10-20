# terraform-cloudflare-edge-shield (`v1.1.0`)

HashiCorp Terraform module and Go validation package for deploying **Utilvo EdgeShield** custom WAF rules on Cloudflare zones. Blocks rotating-IP headless Chromium scrapers hosted on **Tencent Cloud (`AS132203`)**, **Alibaba Cloud (`AS45102`)**, **Huawei Cloud (`AS136907`)**, and **BytePlus (`AS139902`)** while strictly whitelisting verified search engine crawlers (`cf.client.bot`, `Googlebot`, `Bingbot`, `Applebot`, `DuckDuckBot`).

- **Official Interactive Firewall Builder & `access.log` Scanner:** [https://utilvo.com/edge-shield](https://utilvo.com/edge-shield)
- **Live Self-Updating ASN/CIDR Threat Feed API:** [https://utilvo.com/api/edge-shield/threats](https://utilvo.com/api/edge-shield/threats)

## Usage (Terraform)

```hcl
module "utilvo_edge_shield" {
  source  = "github.com/utilvo/terraform-cloudflare-edge-shield"
  zone_id = var.cloudflare_zone_id
}
```

## License

MIT © [Utilvo Security](https://utilvo.com/edge-shield)
