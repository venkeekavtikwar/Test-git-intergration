provider "aws" {
  region = "us-west-2"  # Replace with your preferred region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with a unique bucket name
  acl    = "private"

resource "aws_s3_bucket_public_access_block" "block_public_acls" {
    bucket = aws_s3_bucket.my_bucket.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

  tags = {
    Name        = "My bucket"    # comment
    Environment = "Dev"
  }
}
