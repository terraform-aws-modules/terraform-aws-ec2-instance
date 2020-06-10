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

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instances\_number | n/a | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| ebs\_volume\_attachment\_id | The volume ID |
| ebs\_volume\_attachment\_instance\_id | The instance ID |
| instances\_public\_ips | Public IPs assigned to the EC2 instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
