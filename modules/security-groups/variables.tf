variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
}

variable "allowed_ssh_ips" {
  description = "List of CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Adjust to your needs for more secure access
}

variable "master_cidr_blocks" {
  description = "CIDR blocks allowed to access master nodes"
  type        = list(string)
}

variable "worker_cidr_blocks" {
  description = "CIDR blocks allowed to access worker nodes"
  type        = list(string)
}

variable "etcd_cidr_blocks" {
  description = "CIDR blocks allowed to access etcd nodes"
  type        = list(string)
}

variable "storage_cidr_blocks" {
  description = "CIDR blocks allowed to access storage nodes"
  type        = list(string)
}
variable "haproxy_cidr_blocks" {
  description = "CIDR blocks allowed to access HAProxy nodes"
  default     = ["0.0.0.0/0"]
}

