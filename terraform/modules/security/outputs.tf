output "kube_sg_id" {
  description = "kubernetes security group ID"
  value       = aws_security_group.kube_sg.id
}