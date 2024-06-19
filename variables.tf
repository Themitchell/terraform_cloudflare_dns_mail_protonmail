variable "zone_id" {
  description = "The zone id"
  type        = string
}

variable "verification_code" {
  description = "The text record domain verification code"
  type        = string
}

variable "dmarc_email" {
  description = "The email to send dmarc reports to"
  type        = string
  default     = null
}

variable "domain_key" {
  description = "The unique domain key from protonmail"
  type        = string
}

variable "ttl" {
  description = "The TTL for DNS records"
  type        = number
  default     = 10800
}
