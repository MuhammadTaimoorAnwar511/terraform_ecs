# modules/target_group/variables.tf

variable "name" {
  type        = string
  description = "Name of the target group"
}

variable "port" {
  type        = number
  description = "Port for the target group"
}

variable "health_check_path" {
  type        = string
  description = "Health check path for target group"
  default     = "/"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where target group is created"
}

variable "tags" {
  type    = map(string)
  default = {}
}
