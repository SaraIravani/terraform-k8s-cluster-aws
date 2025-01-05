output "master_sg_id" {
  value = aws_security_group.master_sg.id
}

output "worker_sg_id" {
  value = aws_security_group.worker_sg.id
}

output "etcd_sg_id" {
  value = aws_security_group.etcd_sg.id
}

output "storage_sg_id" {
  value = aws_security_group.storage_sg.id
}
output "haproxy_sg_id" {
  value = aws_security_group.haproxy_sg.id
}

