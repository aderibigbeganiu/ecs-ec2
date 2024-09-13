# module "secrets" {
#   source = "exlabs/ecs-secrets-manager/aws"
#   # We recommend pinning every module to a specific version
#   version = "1.1.0"
#   name    = "${var.namespace}-${var.environment}"

# #   ecs_task_execution_roles = [
# #     "ecs-task-execution-role1",
# #     "ecs-task-execution-role2"
# #   ]

#   key_names = [
#     "DATABASE_URI",
#     "ADMIN_EMAIL",
#     "ADMIN_PASSWORD",
#     "ADMIN_COOKIE_SECRET",
#     "CORS_WHITELIST",
#     "PORT",
#     "JWT_SECRET",
#     "NODE_ENV",
#     "CLOUDINARY_CLOUD_NAME",
#     "CLOUDINARY_API_KEY",
#     "CLOUDINARY_API_SECRET",
#     "CLOUDINARY_FOLDER",
#     "BASE_URL",
#   ]
# }