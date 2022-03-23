provider "aws" {
  region = "us-west-1"
}

# module "bucket" {

#   source  = "clouddrove/s3/aws"
#   version = "0.15.0"

#   name        = "logs"
#   environment = "example"
#   label_order = ["name", "environment"]

#   versioning = true
#   acl        = "private"
# }

module "vpc" {
  source = "../"

  name        = "vpc"
  environment = "example"
  label_order = ["name", "environment"]

  vpc_enabled           = true
  cidr_block            = "10.0.0.0/16"
  enable_flow_log       = false
  # s3_bucket_arn         = module.bucket.arn
  additional_cidr_block = ["172.3.0.0/16", "172.2.0.0/16"]
}
