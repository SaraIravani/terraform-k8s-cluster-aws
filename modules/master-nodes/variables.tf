variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
}

variable "environment" {
  description = "Environment for deployment (e.g., dev, prod)"
  default     = "dev"
}

variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "EC2 instance type for master nodes"
  default     = "t2.medium"
}

variable "key_name" {
  description = "Key pair name for SSH access to instances"
}

variable "subnet_ids" {
  description = "List of subnet IDs for master nodes"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for master nodes"
}
variable "allowed_ssh_ips" {
  description = "List of CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "master_cidr_blocks" {
  description = "CIDR blocks allowed to access master nodes"
  type        = list(string)
}

variable "worker_cidr_blocks" {
  description = "CIDR blocks allowed to access worker nodes"
  type        = list(string)
}
variable "master_sg_id" {
  type = string
}

