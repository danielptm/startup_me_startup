provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/danieltuttle/.aws/credentials"
  profile                 = "default"
}

resource "aws_instance" "example" {
  ami           = "ami-13be557e"
  instance_type = "t2.small"
}

#
# resource "aws_s3_bucket" "b" {
#   bucket = var.BUCKET
#   acl    = "private"
#
#   tags = {
#     Name        = var.BUCKET
#     Environment = "Dev"
#   }
# }
