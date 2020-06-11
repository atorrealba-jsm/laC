provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
  id = "vpc-eb74ef91"
}

resource "aws_security_group" "lb_sg" {
  name        = "lb_sg"
  description = "Allow inbound traffic"
  vpc_id      = "vpc-eb74ef91"

  ingress {
    description = "Http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lb_sg"
  }
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.lb_sg.id}"]
  subnets            = "${var.subnet}"

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_lb_target_group.test.arn}"
  target_id        = "${aws_instance.test.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = "${aws_lb_target_group.test2.arn}"
  target_id        = "${aws_instance.test2.id}"
  port             = 80
}

resource "aws_lb_target_group" "test" {
  name     = "test"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-eb74ef91" # "${aws_vpc.default.id}"
}

resource "aws_lb_target_group" "test2" {
  name     = "test2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-eb74ef91" # "${aws_vpc.default.id}"
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.test.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.test.arn}"
  }
}

resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = "${aws_lb_listener.front_end.arn}"
  priority     = 99

  action {
    type = "forward"
    forward {
      target_group {
        arn    = "${aws_lb_target_group.test.arn}"
        weight = 50
      }

      target_group {
        arn    = "${aws_lb_target_group.test2.arn}"
        weight = 50
      }

    }
  }
  condition {
    host_header {
      values = ["my-service.*.terraform.io"]
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Test"
  }
}

resource "aws_instance" "test2" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Test2"
  }
}