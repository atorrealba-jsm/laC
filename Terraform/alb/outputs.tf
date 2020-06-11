output "this_lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_lb.test.id}"]
}

output "this_lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = ["${aws_lb.test.arn}"]
}

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = ["${aws_lb.test.dns_name}"]
}

output "this_lb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value       = ["${aws_lb.test.arn_suffix}"]
}

output "this_lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = ["${aws_lb.test.zone_id}"]
}

output "https_listener_arn" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = ["${aws_lb_listener.front_end.arn}"]
}

output "https_listener_id" {
  description = "The IDs of the load balancer listeners created."
  value       = ["${aws_lb_listener.front_end.id}"]
}

output "target_group_arn" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = ["${aws_lb_target_group.test.arn}"]
}

output "target_group_arn_suffixes" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = ["${aws_lb_target_group.test.arn_suffix}"]
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = ["${aws_lb_target_group.test.name}"]
}
