resource "aws_s3_bucket" "b" {
  bucket = "terrastartup.com"
  acl    = "private"

  tags = {
    Name = "terrastartup.com"
  }
}
