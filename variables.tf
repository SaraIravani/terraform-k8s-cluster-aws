variable "aws_region" {
  description = "AWS region for resources"
  default     = "ca-central-1a"
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  default     = "k8s-cluster"
}

variable "environment" {
  description = "Deployment environment"
  default     = "dev"
}

