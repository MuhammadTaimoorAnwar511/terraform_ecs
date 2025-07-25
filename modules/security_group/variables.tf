# module/security_group/variables.tf
variable "sg_name" {
  type        = string
  description = "Name of the Security Group"
}

variable "sg_description" {
  type        = string
  description = "Description of the Security Group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to associate the SG with"
}

variable "allowed_cidrs" {
  type        = list(string)
  description = "CIDR blocks allowed for ingress"
}

variable "tags" {
  type    = map(string)
  default = {}
}
