locals {
  module = "vpc"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env_prefix}-VPC"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["${var.private_subnets[0]}", "${var.private_subnets[1]}", "${var.private_subnets[2]}"]
  public_subnets  = ["${var.public_subnets[0]}", "${var.public_subnets[1]}", "${var.public_subnets[2]}"]

  enable_nat_gateway    = true
  single_nat_gateway    = true
  reuse_nat_ips         = true
  enable_vpn_gateway    = false
  external_nat_ip_ids   = [var.nat_ip_id]
  enable_dns_hostnames  = true
  enable_dns_support    = true
  public_subnet_names   = ["${var.env_prefix}-public-2a", "${var.env_prefix}-public-2b", "${var.env_prefix}-public-2c"]
  private_subnet_names  = ["${var.env_prefix}-private-2a", "${var.env_prefix}-private-2b", "${var.env_prefix}-private-2c"]

  tags = {
    Purpose = "vpc for ${var.env_prefix} environment aws resources"
  }

public_subnet_tags = {
  Purpose = "allow the internet for aws resource"
  Tier    = "public"
}

private_subnet_tags = {
  Purpose = "avoid the internet request for the private aws resources"
  Tier    = "private"
}

nat_gateway_tags = {
  Name    = "${var.env_prefix}-NAT"
  Purpose = "NAT Gateway for internet communication"
}

public_route_table_tags = {
  Name    = "${var.env_prefix}-public-rt"
  Purpose = "traffic flow between subnets and over the internet"
}

private_route_table_tags = {
  Name    = "${var.env_prefix}-private-rt"
  Purpose = "traffic flow between subnets"
}

igw_tags = {
  Name    = "${var.env_prefix}-ig"
  Purpose = "Enables communication between your VPC and the internet"
}
}