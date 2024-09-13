variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}

variable "key_pair" {
  type        = string
  description = "Key pair"
  default     = "kufuli"
}

variable "namespace" {
  description = "Namespace for resource names"
  default     = "kufuli"
  type        = string
}

variable "environment" {
  description = "Environment for resource names"
  default     = "test"
  type        = string
}

variable "container_port" {
  description = "Container port"
  default     = 80
  type        = number
}