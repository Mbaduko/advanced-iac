variable "project_name" {
  description = "The name to the project"
  type        = string
  default     = "Dom04"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "ssh_cidr" {
  description = "The CIDR block to allow SSH access from"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_cidr, 0))
    error_message = "Invalid CIDR block for SSH access"
  }
}

variable "environment" {
  description = "The environment to deploy resources"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod"
  }
}