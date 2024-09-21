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
      { name = "DATABASE_URI", value = "mongodb+srv://abayomiganiy:04wO844HAXtQVYg3@cluster0.7i1kopr.mongodb.net/kufuli" },
      { name = "ADMIN_EMAIL", value = "admin@kufuli.app" },
      { name = "ADMIN_PASSWORD", value = "Adeganew1!" },
      { name = "ADMIN_COOKIE_SECRET", value = "2X2n58a4QvrllacMZVB8b6ajLOrH5PIVvbweniohuytevurrihoui" },
      { name = "CORS_WHITELIST", value = "https://dashboard.kufuli.app" },
      { name = "PORT", value = "8000" },
      { name = "JWT_SECRET", value = "2X2n58a4QvrllacMZVB8b6ajLOrH5PIVvbweniohuytevurrihoui" },
      { name = "NODE_ENV", value = "production" },
      { name = "CLOUDINARY_CLOUD_NAME", value = "dv2tl4udt" },
      { name = "CLOUDINARY_API_KEY", value = "646882184677319" },
      { name = "CLOUDINARY_API_SECRET", value = "AlZMQbs_tAd7kiitC_dZNYe75xM" },
      { name = "CLOUDINARY_FOLDER", value = "kufuli" },
      { name = "BASE_URL", value = "https://api.kufuli.app" },
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
