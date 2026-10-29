variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"

  validation {
    condition     = can(cidrsubnet(var.vpc_cidr, 8, 0))
    error_message = "Invalid CIDR block for VPC"
  }
}

variable "project_name" {
  type        = string
  description = "Project name to use for tagging"
}

variable "environment" {
  type        = string
  description = "The environment to deploy resources"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod"
  }
}