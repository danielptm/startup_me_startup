provider "aws" {
  access_key = local.AWS_ACCESS_KEY
  secret_key = local.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

resource "ec2_instance" "example" {
  ami           = var.AMI
  instance_type = "t2.small"
}

resource "aws_s3_bucket" "b" {
  bucket = local.BUCKET
  acl    = "private"

  tags = {
    Name        = local.BUCKET
    Environment = "Dev"
  }
}
