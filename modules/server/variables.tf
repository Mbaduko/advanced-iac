variable "project_name" {
  description = "The name to the project"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
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

variable "key_path" {
  description = "The path to save the private key file"
  type        = string
  default     = "~/.ssh/Dom04-server_key.pem"
}

variable "ssh_cidr" {
  description = "The CIDR block to allow SSH access from"
  type        = string
}

variable "http_cidr" {
  description = "The CIDR block to allow HTTP access from"
  type        = string
  default     = "0.0.0.0/0"
}