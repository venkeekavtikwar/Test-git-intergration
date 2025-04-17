provider "aws" {
  region = "us-west-2"  # Replace with your preferred region
}

provider "aws" {
  region = "us-west-2"  # Replace with your preferred region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
