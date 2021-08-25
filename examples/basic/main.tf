provider "aws" {
  region = local.region
}

locals {
  availability_zone = "eu-west-1a"
  name              = "example-ec2-basic"
  region            = "eu-west-1"

  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"
  EOT

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
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

  tags = local.tags
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

  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  tags = local.tags
}

resource "aws_eip" "this" {
  vpc      = true
  instance = module.ec2.id[0]
}

resource "aws_placement_group" "web" {
  name     = "hunky-dory-pg"
  strategy = "cluster"
}

resource "aws_kms_key" "this" {
}

resource "aws_network_interface" "this" {
  subnet_id = element(module.vpc.private_subnets, 0)
}

################################################################################
# EC2 Module
################################################################################
module "ec2_zero" {
  source = "../../"
  # This instance won't be created

  name                   = "example-zero"
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "c5.large"
  subnet_id              = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids = [module.security_group.security_group_id]

  tags = local.tags
}

module "ec2" {
  source = "../../"

  name          = "example-normal"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "c5.large"
  subnet_id     = element(module.vpc.private_subnets, 0)
  # private_ips                 = ["172.31.32.5", "172.31.46.20"]
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
  placement_group             = aws_placement_group.web.id

  user_data_base64 = base64encode(local.user_data)

  enable_volume_tags = false
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
      tags = {
        Name = "my-root-block"
      }
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 5
      encrypted   = true
      kms_key_id  = aws_kms_key.this.arn
    }
  ]

  tags = local.tags
}

module "ec2_with_t2_unlimited" {
  source = "../../"

  name          = "example-t2-unlimited"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  cpu_credits   = "unlimited"
  subnet_id     = element(module.vpc.private_subnets, 0)
  # private_ip                  = "172.31.32.10"
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true

  tags = local.tags
}

module "ec2_with_t3_unlimited" {
  source = "../../"

  name                        = "example-t3-unlimited"
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.large"
  cpu_credits                 = "unlimited"
  subnet_id                   = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true

  tags = local.tags
}

module "ec2_with_metadata_options" {
  source = "../../"

  name                        = "example-metadata_options"
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.small"
  subnet_id                   = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }

  tags = local.tags
}

module "ec2_with_network_interface" {
  source = "../../"

  name            = "example-network"
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "c5.large"
  placement_group = aws_placement_group.web.id

  network_interface = [
    {
      device_index          = 0
      network_interface_id  = aws_network_interface.this.id
      delete_on_termination = false
    }
  ]

  tags = local.tags
}

module "ec2_optimize_cpu" {
  source = "../../"

  instance_count = 1

  name          = "example-optimize-cpu"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "c4.2xlarge"
  subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]

  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
  placement_group             = aws_placement_group.web.id

  user_data_base64 = base64encode(local.user_data)

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]
  cpu_core_count       = 2 # default 4
  cpu_threads_per_core = 1 # default 2

  tags = {
    "Env"      = "Private"
    "Location" = "Secret"
  }
}
