locals {
  dmarc_mailto = var.dmarc_email == null ? "" : "rua=mailto:${var.dmarc_email};"
}


module "mail_records" {
  source = "git@github.com:Themitchell/terraform_cloudflare_dns_mail"

  zone_id = var.zone_id

  mail_servers = [
    "mail.protonmail.ch.",
    "mailsec.protonmail.ch."
  ]

  dmarc        = "v=DMARC1; p=reject; pct=100; adkim=s; aspf=s; ${local.dmarc_mailto}"
  spf          = "v=spf1 include:_spf.protonmail.ch include:_mailcust.gandi.net mx ~all"
  verification = "protonmail-verification=${var.verification_code}"

  domain_keys = {
    "protonmail._domainkey"  = "protonmail.domainkey.${var.domain_key}.domains.proton.ch."
    "protonmail2._domainkey" = "protonmail2.domainkey.${var.domain_key}.domains.proton.ch."
    "protonmail3._domainkey" = "protonmail3.domainkey.${var.domain_key}.domains.proton.ch."
  }

  ttl = var.ttl
}
