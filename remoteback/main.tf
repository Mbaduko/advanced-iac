provider "aws" {
  region = var.aws_region

  default_tags {
    tags= {
        Project = var.project_name
        ManagedBy = "Terraform"
        Environment = var.environment
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "tfstate" {
    bucket = "${var.project_name}-${data.aws_caller_identity.current.account_id}-state"

    lifecycle{
        prevent_destroy = true
    }
}

resource "aws_kms_key" "tfstate" {
    description = "KMS key for encrypting Terraform state in S3 bucket"
    enable_key_rotation = true
}

resource "aws_kms_alias" "tfstate" {
  name          = "alias/${var.project_name}"
  target_key_id = aws_kms_key.tfstate.key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tfstate.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "tfstate" {
    bucket = aws_s3_bucket.tfstate.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
    bucket = aws_s3_bucket.tfstate.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

