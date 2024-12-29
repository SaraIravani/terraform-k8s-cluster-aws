variable "aws_region" {
  description = "AWS region for resources"
  default     = "ca-central-1"
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  default     = "k8s-cluster"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
  description = "Deployment environment"
  default     = "dev"
}

