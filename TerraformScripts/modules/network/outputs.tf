output "vpc_id" {
  value       = tolist(data.aws_vpcs.selected.ids)[0]
  description = "The id of the VPC."
}

output "private_subnet_list" {
  value       = tolist(data.aws_subnets.private.ids)
  description = "The list of the private subnets."
}

output "public_subnet_list" {
  value       = tolist(data.aws_subnets.public.ids)
  description = "The list of the public subnets."
}
