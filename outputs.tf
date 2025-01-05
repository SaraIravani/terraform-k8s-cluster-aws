output "vpc_id" {
  description = "VPC ID for the Kubernetes cluster"
  value       = module.vpc.vpc_id
}

#output "kubeconfig" {
#  description = "Kubeconfig file for the cluster"
#  value       = module.master-nodes.kubeconfig
#  sensitive   = true
#}
#
#output "worker_node_ips" {
#  description = "IP addresses of worker nodes"
#  value       = module.worker-nodes.node_ips
#}

