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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.65 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ../../ |  |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_volume_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instances_number"></a> [instances\_number](#input\_instances\_number) | NUmber of instances | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ebs_volume_attachment_id"></a> [ebs\_volume\_attachment\_id](#output\_ebs\_volume\_attachment\_id) | The volume ID |
| <a name="output_ebs_volume_attachment_instance_id"></a> [ebs\_volume\_attachment\_instance\_id](#output\_ebs\_volume\_attachment\_instance\_id) | The instance ID |
| <a name="output_instances_public_ips"></a> [instances\_public\_ips](#output\_instances\_public\_ips) | Public IPs assigned to the EC2 instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
