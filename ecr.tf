resource "aws_ecr_repository" "app" {
  name                 = "${var.namespace}-${var.environment}-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "app_repo_url" {
  value = aws_ecr_repository.app.repository_url
}