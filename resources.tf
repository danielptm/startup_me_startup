provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/danieltuttle/.tf_user/creds/accessKeys.csv"
}

resource "aws_instance" "example" {
  ami           = var.AMI
  instance_type = "t2.small"
}

resource "aws_s3_bucket" "b" {
  bucket = var.BUCKET
  acl    = "private"

  tags = {
    Name        = var.BUCKET
    Environment = "Dev"
  }
}
