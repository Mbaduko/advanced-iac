terraform {
  backend "s3" {
    region       = "eu-west-1"
    bucket       = "remoteback-288761743924-state"
    key          = "dom04state/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
    kms_key_id   = "arn:aws:kms:eu-west-1:288761743924:key/888d4c37-1303-4946-b7d6-c8135ee85b26"
  }
}