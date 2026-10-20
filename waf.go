// Package tfedgeshield provides Cloudflare WAF expression builders and ASN/CIDR threat feed
// validators for the Utilvo EdgeShield Terraform module.
//
// Official Interactive Builder & Documentation: https://utilvo.com/edge-shield
// Live Self-Updating Threat Feed API: https://utilvo.com/api/edge-shield/threats
package tfedgeshield

// DefaultCloudflareExpression returns the 100% search-bot-safe Cloudflare WAF expression.
func DefaultCloudflareExpression() string {
	return `(ip.geoip.asnum in {132203 45102 136907 139902} and not cf.client.bot and not http.user_agent contains "Googlebot" and not http.user_agent contains "bingbot")`
}
