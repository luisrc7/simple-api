provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
        Environment = var.env
        Owner       = "Luis Rodriguez"
        Project     = "Penfold"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tf-penfold-test-state"
    key    = "api-lambda/terraform.tfstate"
    region = "eu-west-1"
  }
}
