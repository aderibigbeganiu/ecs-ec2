resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.namespace}-${var.environment}"
  retention_in_days = 14
}
