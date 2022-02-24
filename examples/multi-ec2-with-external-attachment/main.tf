provider "aws" {
  region = local.region
  default_tags {
    tags = {
      Owner       = "user"
      Environment = "dev"
    }
  }
}

locals {
  availability_zone = "${local.region}a"
  name              = "example-ec2-volume-attachment"
  region            = "us-east-1"
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = "10.99.0.0/18"

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

################################################################################
# EC2 Module - multiple instances with `for_each` and external attachments
################################################################################

locals {
  multiple_instances = {
    one = {
      instance_type = "t3.micro"
      subnet_id     = element(module.vpc.private_subnets, 0)
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          throughput  = 200
          volume_size = 50
          tags = {
            Name = "my-root-block"
          }
        }
      ]
      ebs_block_device = [
        {
          device_name       = "/dev/sdf"
          volume_type       = "gp3"
          volume_size       = 5
          throughput        = 200
          encrypted         = true
          availability_zone = element(module.vpc.azs, 0)
          }, {
          device_name       = "/dev/sdh"
          volume_type       = "gp3"
          volume_size       = 10
          throughput        = 200
          encrypted         = true
          availability_zone = element(module.vpc.azs, 0)
        },
      ]
    }
    two = {
      instance_type = "t3.small"
      subnet_id     = element(module.vpc.private_subnets, 1)
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp2"
          volume_size = 50
        }
      ]
      ebs_block_device = [
        {
          device_name = "/dev/sdf"
          volume_type = "gp3"
          volume_size = 5
          throughput  = 200
          encrypted   = true
          }, {
          device_name = "/dev/sdh"
          volume_type = "gp3"
          volume_size = 10
          throughput  = 200
          encrypted   = true
        },
      ]
    }
    three = {
      instance_type = "t3.medium"
      subnet_id     = element(module.vpc.private_subnets, 2)
      ebs_block_device = [
        {
          device_name = "/dev/sdf"
          volume_type = "gp3"
          volume_size = 5
          throughput  = 200
          encrypted   = true
          }, {
          device_name = "/dev/sdh"
          volume_type = "gp3"
          volume_size = 10
          throughput  = 200
          encrypted   = true
        },
      ]
    }
  }
}

module "ec2_multiple" {
  source = "../../"

  for_each = local.multiple_instances

  name = "${local.name}-multi-${each.key}"

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [module.security_group.security_group_id]

  enable_volume_tags = false
  root_block_device  = lookup(each.value, "root_block_device", [])

  override_ebs_mapping = false
  ebs_block_device     = lookup(each.value, "ebs_block_device", [])

  tags = {}
}
