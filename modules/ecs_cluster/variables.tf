#  modules/ecs_cluster/variables.tf
variable "cluster_name" {
  type        = string
  description = "Name of the ECS Cluster"
}

variable "tags" {
  type    = map(string)
  default = {}
}
