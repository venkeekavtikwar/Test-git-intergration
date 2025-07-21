# DO NOT USE REAL CREDENTIALS
# This is for testing secret detection tools only.

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "compliance-scan-test-bucket"
  acl    = "private"
}
