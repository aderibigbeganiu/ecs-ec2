resource "aws_ecs_cluster" "main" {
  name = "demo-cluster"
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}
