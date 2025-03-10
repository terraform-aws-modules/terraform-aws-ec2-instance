data "aws_ami" "this" {
  count = var.ami == null ? 0 : 1
  filter {
    name   = "image-id"
    values = [var.ami]
  }
}

data "aws_partition" "current" {}

data "aws_ssm_parameter" "this" {
  count = local.create && var.ami == null ? 1 : 0

  name = var.ami_ssm_parameter
}

data "aws_ami" "selected" {
  count = var.ami_os != "override" ? 1 : 0

  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [local.os_search]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}