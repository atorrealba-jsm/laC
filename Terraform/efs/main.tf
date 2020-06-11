provider "aws" {
  region = "us-east-1"
}

resource "aws_efs_file_system" "efstest" {
  tags = {
    Name = "efstest"
  }
}

resource "aws_efs_mount_target" "tgtest" {
  file_system_id = "${aws_efs_file_system.efstest.id}"
  subnet_id      = "subnet-58455b12" # ${aws_subnet.alpha.id}"
}

#resource "aws_vpc" "foo" {
#  cidr_block = "10.0.0.0/16"
#}

#resource "aws_subnet" "alpha" {
#  vpc_id            = "vpc-eb74ef91" # "${aws_vpc.foo.id}"
#  availability_zone = "us-east-1a"
#  cidr_block        = "10.0.1.0/24"
#}