output "master_instance_ids" {
  value = aws_instance.master[*].id
}

output "master_private_ips" {
  value = aws_instance.master[*].private_ip
}

output "master_public_ips" {
  value = aws_instance.master[*].public_ip
}
