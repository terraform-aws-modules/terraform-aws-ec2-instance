provider "aws" {
  region = "eu-west-1"
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

module "ec2" {
  source = "../../"

  name                        = "example"
  ami                         = "${data.aws_ami.amazon_linux.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${data.aws_security_group.default.id}"]
  associate_public_ip_address = true
}
