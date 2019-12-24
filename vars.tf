locals {
  AWS_ACCESS_KEY = "AKIA56GAXAIF7O523BZS"
  AWS_SECRET_KEY = "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"
  BUCKET         = "MY_BUCKET"
}

variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMI" {
  type    = string
  default = "ami-13be557e"
}
