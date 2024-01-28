provider "aws" {
  region  = var.aws_region
  profile = "personal"

  default_tags {
    tags = {
      Terraform        = "true"
      Environment      = var.env
      Project          = var.project
      Application      = local.resource_name
    }
  }  
}

terraform {
  backend "s3" {
    bucket = "personal-app-terraform-state"
    region = "us-west-2"
    key    = "toDoApp/terraform.tfstate"
    profile = "personal"
  }
}

data "aws_vpc" "selected" {
  filter {
    name = "tag:Environment"
    values = ["${var.env}"]
  }
}

module "network" {
  source = "../network"
  environment = var.env
}