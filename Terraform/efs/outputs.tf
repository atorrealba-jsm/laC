output "efs_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_efs_file_system.efstest.id}"]
}

output "efs_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_efs_file_system.efstest.arn}"]
}

output "efs_dns_name" {
  description = "The DNS name of the load balancer."
  value       = ["${aws_efs_file_system.efstest.dns_name}"]
}