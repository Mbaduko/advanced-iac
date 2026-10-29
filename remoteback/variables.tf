variable "aws_region" {
  type        = string
  description = "Aws region to deploy in"
  default     = "eu-west-1"
}

variable "project_name" {
  type        = string
  description = "Project name to use for tagging"
  default     = "remoteback"
}

variable "environment" {
  type        = string
  description = "Environment name to use for tagging"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod"
  }
}