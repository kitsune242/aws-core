variable "environment" {
  description = "The environment name (e.g., dev, test, prod)"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}
