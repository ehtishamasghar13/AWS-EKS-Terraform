provider "aws" {
  region  = var.region
  profile = "personal"

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = var.env
      Project     = var.project
      Module      = local.module
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "personal-app-terraform-state"
    region  = "us-west-2"
    key     = "vpc/terraform.tfstate"
    profile = "personal"
  }
}