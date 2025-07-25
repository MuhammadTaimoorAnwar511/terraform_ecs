# modules/acm/outputs.tf
output "acm_certificate_arn" {
  description = "Validated or raw ACM certificate ARN"
  value = var.enable_acm ? (
    var.acm_dns_validation_auto ?
    aws_acm_certificate_validation.this[0].certificate_arn :
    aws_acm_certificate.this[0].arn
  ) : null
}
