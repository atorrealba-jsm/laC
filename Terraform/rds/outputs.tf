output "this_db_id" {
  description = "The address of the RDS instance"
  value       = "${aws_rds_cluster.postgresql.id}"
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${aws_rds_cluster.postgresql.arn}"
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${aws_rds_cluster.postgresql.availability_zones}"
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${aws_rds_cluster.postgresql.endpoint}"
}

output "this_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = "${aws_rds_cluster.postgresql.hosted_zone_id}"
}


