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

variable "allowed_ssh_ips" {
  description = "List of CIDR blocks allowed for SSH access"
  default     = ["0.0.0.0/0"]
}

variable "master_cidr_blocks" {
  description = "CIDR blocks allowed to access master nodes"
  default     = ["10.0.0.0/24"]
}

variable "worker_cidr_blocks" {
  description = "CIDR blocks allowed to access worker nodes"
  default     = ["10.0.1.0/24"]
}

variable "etcd_cidr_blocks" {
  description = "CIDR blocks allowed to access etcd nodes"
  default     = ["10.0.2.0/24"]
}

variable "storage_cidr_blocks" {
  description = "CIDR blocks allowed to access storage nodes"
  default     = ["10.0.3.0/24"]
}
variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 1
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "etcd_count" {
  description = "Number of etcd nodes"
  type        = number
  default     = 3
}

variable "haproxy_count" {
  description = "Number of HAProxy nodes"
  type        = number
  default     = 1
}

variable "storage_count" {
  description = "Number of storage nodes"
  type        = number
  default     = 2
}

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "ca-central-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}
