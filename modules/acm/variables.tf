# modules/acm/variables.tf
variable "enable_acm" {
  type        = bool
  default     = false
  description = "Whether to request ACM certificate"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the ACM certificate"
}

variable "acm_dns_validation_auto" {
  type        = bool
  default     = false
  description = "If true, create Route53 records for automatic DNS validation"
}

variable "route53_zone_id" {
  type        = string
  default     = ""
  description = "Route 53 hosted zone ID (required if auto validation is enabled)"
}

variable "tags" {
  type    = map(string)
  default = {}
}
