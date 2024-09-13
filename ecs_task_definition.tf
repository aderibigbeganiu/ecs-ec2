# --- ECS Task Definition ---

resource "aws_ecs_task_definition" "app" {
  family             = "${var.namespace}-${var.environment}-app"
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_exec_role.arn
  network_mode       = "awsvpc"
  cpu                = 1024
  memory             = 970

  container_definitions = jsonencode([{
    name         = "app",
    image        = "${aws_ecr_repository.app.repository_url}:latest",
    essential    = true,
    portMappings = [{ containerPort = var.container_port, hostPort = var.container_port }],

    environment = [
      { name = "EXAMPLE", value = "example" },
    ]

    # secrets = module.secrets.ecs_secrets,

    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = "${var.region}",
        "awslogs-group"         = aws_cloudwatch_log_group.ecs.name,
        "awslogs-stream-prefix" = "app"
      }
    },
  }])
}
