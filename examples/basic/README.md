# Basic EC2 instance

Configuration in this directory creates EC2 instances with minimum set of arguments. It will also assign Elastic IP (EIP) to an instance.

Unspecified arguments for security group id and subnet are inherited from the default VPC.

This example outputs instance id and public DNS name as a single value and as a list.

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
| credit_specification | Credit specification of EC2 instance (empty list for not t2 instance types) |
| credit_specification_t2_unlimited | Credit specification of t2-type EC2 instance |
| ids | List of IDs of instances |
| ids_t2 | List of IDs of t2-type instances |
| instance_id | EC2 instance ID |
| instance_public_dns | Public DNS name assigned to the EC2 instance |
| public_dns | List of public DNS names assigned to the instances |
| tags | List of tags |
| vpc_security_group_ids | List of VPC security group ids assigned to the instances |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
