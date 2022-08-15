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