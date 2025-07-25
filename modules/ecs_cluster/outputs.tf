#  modules/ecs_cluster/outputs.tf
output "cluster_name" {
  value = aws_ecs_cluster.this.name
}
