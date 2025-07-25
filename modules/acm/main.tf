# modules/acm/main.tf
resource "aws_acm_certificate" "this" {
  count             = var.enable_acm ? 1 : 0
  domain_name       = var.domain_name
  validation_method = "DNS"
  tags              = var.tags
}

locals {
  domain_validation_option = one(aws_acm_certificate.this[0].domain_validation_options)
}

resource "aws_route53_record" "validation" {
  count   = var.enable_acm && var.acm_dns_validation_auto ? 1 : 0

  name    = local.domain_validation_option.resource_record_name
  type    = local.domain_validation_option.resource_record_type
  zone_id = var.route53_zone_id
  records = [local.domain_validation_option.resource_record_value]
  ttl     = 300
}
resource "aws_acm_certificate_validation" "this" {
  count = var.enable_acm && var.acm_dns_validation_auto ? 1 : 0

  certificate_arn         = aws_acm_certificate.this[0].arn
  validation_record_fqdns = [aws_route53_record.validation[0].fqdn]

  depends_on = [aws_route53_record.validation] 
}


