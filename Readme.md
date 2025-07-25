### aws configure
### cat ~/.aws/credentials
### aws configure --profile=
### export AWS_PROFILE=

===================================
### terraform init
### terraform validate
### terraform plan
### terraform apply
### terraform destroy -auto-approve

==================================
# 🚀 Terraform Infrastructure for MyApp (ECS + ALB + ACM + VPC)

This Terraform project provisions a scalable and secure AWS infrastructure for containerized applications. It includes:

- VPC with public/private subnets
- Application Load Balancer(ALB)
- ECS Cluster (Fargate-ready)
- Optional ACM certificate with DNS validation
- Target Group for ALB service
- Security groups for ALB