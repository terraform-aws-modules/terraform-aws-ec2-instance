# EC2 instance with EBS volume attachment

Configuration in this directory creates EC2 instances, EBS volume and attach it together.

Unspecified arguments for security group id and subnet are inherited from the default VPC.

This example outputs instance id and EBS volume id.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.65 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| ec2 | ../../ |  |
| security_group | terraform-aws-modules/security-group/aws | ~> 3.0 |

## Resources

| Name |
|------|
| [aws_ami](https://registry.terraform.io/providers/hashicorp/aws/2.65/docs/data-sources/ami) |
| [aws_ebs_volume](https://registry.terraform.io/providers/hashicorp/aws/2.65/docs/resources/ebs_volume) |
| [aws_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/2.65/docs/data-sources/subnet_ids) |
| [aws_volume_attachment](https://registry.terraform.io/providers/hashicorp/aws/2.65/docs/resources/volume_attachment) |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/2.65/docs/data-sources/vpc) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instances\_number | NUmber of instances | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| ebs\_volume\_attachment\_id | The volume ID |
| ebs\_volume\_attachment\_instance\_id | The instance ID |
| instances\_public\_ips | Public IPs assigned to the EC2 instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
