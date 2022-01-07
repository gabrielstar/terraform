output "instance_id" {
  description = "ID of my EC2 instance"
  value       = aws_instance.gabriel_server.id
}

output "instance_public_ip" {
  value       = aws_instance.gabriel_server.public_ip
  description = "Public IP of my instance"
}