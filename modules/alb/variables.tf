# modules/alb/variables.tf
variable "alb_name" {}
variable "vpc_id" {}
variable "public_subnets" {}
variable "security_groups" {}
variable "target_group_arn" {}

variable "enable_acm" {
  type    = bool
  default = false
}

variable "acm_certificate_arn" {
  type    = string
  default = null
}
