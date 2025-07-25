#variables.tf
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "MyAppVPC"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}
variable "enable_nat_gateway" {
  description = "Whether to provision NAT Gateways"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Provision a single shared NAT Gateway"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Provision one NAT Gateway per Availability Zone"
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {
    Environment = "dev"
    Project     = "MyApp"
  }
}
# SECURITY GROUP VARIABLES

variable "backend_alb_sg_name" {
  type        = string
  description = "Name of the backend ALB security group"
}

variable "backend_alb_sg_description" {
  type        = string
  description = "Description for the backend ALB security group"
}

variable "backend_alb_allowed_cidrs" {
  type        = list(string)
  description = "CIDR blocks allowed to access backend ALB"
}
# TARGET GROUP VARIABLES
variable "backend_tg_name" {
  type        = string
  description = "Name for the backend target group"
}

variable "backend_tg_port" {
  type        = number
  description = "Port for the backend target group"
}

variable "backend_tg_health_check_path" {
  type        = string
  description = "Health check path for backend target group"
  default     = "/"
}
# ACM VARIABLES
variable "enable_acm" {
  type        = bool
  default     = false
}

variable "acm_domain_name" {
  type        = string
  default     = ""
}

variable "acm_dns_validation_auto" {
  type        = bool
  default     = false
  description = "If true, automatically create Route53 DNS records for ACM validation"
}

variable "route53_zone_id" {
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  type    = string
  default = null
}
# ECS CLUSTER VARIABLES
variable "cluster_name" {
  type        = string
  default     = "backend-cluster"
  description = "Name of the ECS Cluster"
}
