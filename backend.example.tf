terraform {
  backend "s3" {
    region       = "ex-example-1"
    bucket       = "remotebackend-288761743924-state"
    key          = "examplestate/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
    kms_key_id   = "arn:aws:kms:as-sdsd-1:288weqwe743924:key/888d4c37-1303-4946-b7d6-c8135ee85b26"
  }
}