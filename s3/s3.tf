resource "aws_s3_bucket" "b" {
  bucket = "MY_BUCKET"
  acl    = "private"

  tags = {
    Name = "MY_BUCKET"
  }
}
