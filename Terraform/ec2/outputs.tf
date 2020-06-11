output "id" {
  description = "List of IDs of instances"
  value       = ["${aws_instance.web.id}"]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = ["${aws_instance.web.public_dns}"]
}

