variable "aws_region" {
  description = "AWS region"
  default     = "ca-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
}

