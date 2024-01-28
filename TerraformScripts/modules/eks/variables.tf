variable "aws_region" {
  default = "us-west-2"
  description = "AWS region to use"  
}

variable "env" {
  description = "Can be production,staging etc"  
}

variable "env_prefix" {
  description = "Can be prod, stage etc"  
}

variable "project" {
  default = "personalTest"
  description = "Value to be used in the tags project"    
}

variable "cluster_version" {
  description = "EKS cluster version use"  
}

variable "instance_type" {
  description = "Instance type which going to use for eks"  
}
