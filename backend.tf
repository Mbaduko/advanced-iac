terraform {
    backend "s3" {
        region = "ex-region-1"
        bucket= "example-myid-state"
        key= "example/terraform.tfstate"
        use_lockfile = true
        encrypt = true
        kms_key_id = "arn:aws:kms:eu-west-1:288762313224:key/888d4c37-1303-4946-b7d6-123123ee85b26"
    }
}