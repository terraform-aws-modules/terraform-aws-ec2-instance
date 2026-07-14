provider "aws" {
  region = local.region
}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "us-east-1"

  # Change this string and re-run `terraform plan` to verify the instance is not
  # replaced (nor updated in-place) due to the `ignore_changes` lifecycle rule
  user_data = <<-EOT
    #!/bin/bash
    echo "Hello Terraform v2 - changed!"
  EOT

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

################################################################################
# EC2 Module
################################################################################

# Plain `user_data`
module "ec2_user_data" {
  source = "../../"

  name = "${local.name}-plain"

  subnet_id             = element(tolist(data.aws_subnets.default.ids), 0)
  security_group_vpc_id = data.aws_vpc.default.id

  user_data                = local.user_data
  ignore_user_data_changes = true

  tags = local.tags
}

# `user_data_base64`
module "ec2_user_data_base64" {
  source = "../../"

  name = "${local.name}-base64"

  subnet_id             = element(tolist(data.aws_subnets.default.ids), 0)
  security_group_vpc_id = data.aws_vpc.default.id

  user_data_base64         = base64encode(local.user_data)
  ignore_user_data_changes = true

  tags = local.tags
}

# Control: same user data, but changes are *not* ignored (module default)
module "ec2_user_data_not_ignored" {
  source = "../../"

  name = "${local.name}-not-ignored"

  subnet_id             = element(tolist(data.aws_subnets.default.ids), 0)
  security_group_vpc_id = data.aws_vpc.default.id

  user_data = local.user_data

  tags = local.tags
}
