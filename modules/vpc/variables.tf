#modules/vpc/variables.tf
variable "vpc_name" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
}

variable "azs" {
  type        = list(string)
}

variable "public_subnets" {
  type        = list(string)
}

variable "private_subnets" {
  type        = list(string)
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  type        = bool
  default     = false
}

variable "tags" {
  type        = map(string)
  default     = {}
}