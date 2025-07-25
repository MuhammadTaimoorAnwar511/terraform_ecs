# terraform.tfvars
aws_region         = "us-east-1"
# VPC configuration
vpc_name           = "MyAppVPC"
vpc_cidr           = "10.0.0.0/16"
azs                = ["us-east-1a", "us-east-1b"]

public_subnets     = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets    = ["10.0.2.0/24", "10.0.3.0/24"]

# NAT Gateway configuration
enable_nat_gateway       = true
single_nat_gateway       = true
one_nat_gateway_per_az   = false

# Backend ALB Security Group config
backend_alb_sg_name        = "MYAPP-backend-alb-sg"
backend_alb_sg_description = "Security group for MYAPP backend ALB"
backend_alb_allowed_cidrs  = ["0.0.0.0/0"]

# ALB Target Group Config
backend_tg_name                = "MYAPP-backend-tg"
backend_tg_port                = 5000
backend_tg_health_check_path   = "/"

# ACM Certificate Config
enable_acm               = true
acm_domain_name          = "taimoor.quecko.org"
acm_dns_validation_auto  = false
route53_zone_id          = "Z3P5QSUBK4POTI"  # Your actual Hosted Zone ID
# ECS Cluster Config
cluster_name = "MYAPP-backend-cluster"

# Global tags
tags = {
  Environment = "dev"
  Project     = "MyApp"
}
