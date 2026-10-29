output "tfstate_bucket_name" {
  value = aws_s3_bucket.tfstate.bucket
}

output "tfstate_kms_key_arn" {
    value= aws_kms_key.tfstate.arn
}