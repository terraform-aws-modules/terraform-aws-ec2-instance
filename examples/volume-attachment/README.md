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

## Outputs

| Name | Description |
|------|-------------|
| ebs_volume_attachment_id | The volume ID |
| ebs_volume_attachment_instance_id | The instance ID |
| instance_id | EC2 instance ID |
| instance_public_dns | Public DNS name assigned to the EC2 instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
