#main.tf
module "vpc" {
  source = "./modules/vpc"
  
  # Pass all variables to VPC module
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  azs                     = var.azs
  public_subnets          = var.public_subnets
  private_subnets         = var.private_subnets
  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
  one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  tags                    = var.tags
}
module "backend_alb_sg" {
  source = "./modules/security_group"

  sg_name        = var.backend_alb_sg_name
  sg_description = var.backend_alb_sg_description
  vpc_id         = module.vpc.vpc_id
  allowed_cidrs  = var.backend_alb_allowed_cidrs
  tags           = var.tags
}
module "backend_target_group" {
  source             = "./modules/target_group"
  name               = var.backend_tg_name
  port               = var.backend_tg_port
  health_check_path  = var.backend_tg_health_check_path
  vpc_id             = module.vpc.vpc_id
  tags               = var.tags
}
module "acm_certificate" {
  source                  = "./modules/acm"
  enable_acm              = var.enable_acm
  domain_name             = var.acm_domain_name
  acm_dns_validation_auto = var.acm_dns_validation_auto
  route53_zone_id         = var.route53_zone_id
  tags                    = var.tags
}
module "application_load_balancer" {
  source              = "./modules/alb"
  alb_name            = "backend-alb"
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  security_groups  = [module.backend_alb_sg.backend_alb_sg_id]            
  target_group_arn = module.backend_target_group.target_group_arn 

  enable_acm          = var.enable_acm
  acm_certificate_arn = module.acm_certificate.acm_certificate_arn
}
module "ecs_cluster" {
  source       = "./modules/ecs_cluster"
  cluster_name = "backend-cluster"
  tags         = var.tags
}



