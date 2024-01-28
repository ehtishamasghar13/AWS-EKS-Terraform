data "aws_vpcs" "selected" {
  tags = {
    Environment = var.environment
  }
}

# data "aws_vpc" "main" {
#   filter {
#     name   = "tag:Environment"
#     values = [var.environment]
#   }
# }

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [tolist(data.aws_vpcs.selected.ids)[0]]
  }
  tags = {
    Environment = var.environment
    Tier = "private"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [tolist(data.aws_vpcs.selected.ids)[0]]
  }

  tags = {
    Environment = var.environment
    Tier = "public"
  }
}