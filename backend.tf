terraform {
  # Values are supplied at init time:
  #   terraform init -backend-config=backend.hcl
  # See backend.hcl.example for the required keys.
  backend "s3" {}
}
