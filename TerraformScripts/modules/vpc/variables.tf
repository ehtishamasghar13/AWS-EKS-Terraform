variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "project" {
  description = "Value to be used in the resource tags"
}

variable "env" {
  description = "Can be production,staging, development etc"  
}

variable "env_prefix" {
  description = "Can be prod, stage, dev etc"  
}

variable "nat_ip_id" {
  description = "elastic ip address id which is going to be add to external nat ip"  
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets ip address which going to use in vpc"  
}

variable "public_subnets" {
  type        = list(string)
  description = "Private subnets ip address which going to use in vpc"  
}