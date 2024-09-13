resource "aws_ecs_cluster" "main" {
  name = "${var.namespace}-${var.environment}-cluster"
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}
