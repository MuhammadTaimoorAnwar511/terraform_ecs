# modules/target_group/outputs.tf
output "target_group_arn" {
  description = "ARN of the backend target group"
  value       = aws_lb_target_group.this.arn
}
