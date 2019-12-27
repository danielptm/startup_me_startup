provider "aws" {
  region                  = var.AWS_REGION
  shared_credentials_file = "/Users/danieltuttle/.aws/credentials"
  profile                 = "default"
}

module "ec2" {
  source = "./ec2"
}

module "s3" {
  source = "./s3"
}

module "dynamo" {
  source = "./db"
}

module "route53" {
  source = "./route53"
}
