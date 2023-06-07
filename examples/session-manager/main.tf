provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "eu-west-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-ec2-instance"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# EC2 Module
################################################################################

module "ec2" {
  source = "../../"

  name = local.name

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = element(module.vpc.intra_subnets, 0)
  vpc_security_group_ids = [module.security_group_instance.security_group_id]

  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs           = local.azs
  intra_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 20)]

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

module "security_group_instance" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${local.name}-ec2"
  description = "Security Group for EC2 Instance Egress"

  vpc_id = module.vpc.vpc_id

  egress_rules = ["https-443-tcp"]

  tags = local.tags
}

module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "~> 5.0"

  vpc_id = module.vpc.vpc_id

  endpoints = {
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      subnet_ids          = module.vpc.intra_subnets
      security_group_ids  = [module.security_group_vpc_endpoint.security_group_id]
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true
      subnet_ids          = module.vpc.intra_subnets
      security_group_ids  = [module.security_group_vpc_endpoint.security_group_id]
    },
    ec2messages = {
      service             = "ec2messages"
      private_dns_enabled = true
      subnet_ids          = module.vpc.intra_subnets
      security_group_ids  = [module.security_group_vpc_endpoint.security_group_id]
    },
  }

  tags = local.tags
}

module "security_group_vpc_endpoint" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${local.name}-vpce"
  description = "Security Group for VPC Endpoint Ingress"

  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.intra_subnets_cidr_blocks

  ingress_rules = ["https-443-tcp"]

  tags = local.tags
}
