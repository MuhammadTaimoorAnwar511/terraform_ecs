# modules/security_group/outputs.tf
output "backend_alb_sg_id" {
  description = "Backend ALB security group ID"
  value       = aws_security_group.backend_alb_sg.id
}
