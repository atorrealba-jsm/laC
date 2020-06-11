output "aws_route53_zone_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_route53_zone.primary.zone_id}"]
}

output "aws_route53_zone_sn" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_route53_zone.primary.name_servers}"]
}

output "aws_route53_record_name" {
  description = "The DNS name of the load balancer."
  value       = ["${aws_route53_record.www.name}"]
}
