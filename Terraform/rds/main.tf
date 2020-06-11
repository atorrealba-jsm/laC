provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

resource "aws_rds_cluster_instance" "postgresql_instances" {
  count              = 2
  #identifier         = "aurora-cluster-test-${count.index}"
  cluster_identifier = "${aws_rds_cluster.postgresql.id}"
  instance_class     = "db.m4.large"
}

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "aurora-cluster-test"
  engine                  = "aurora-postgresql"
  engine_version          = "11.6"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "mydb"
  master_username         = "testdb"
  master_password         = "kjsdfsghdkugsfsdff"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}