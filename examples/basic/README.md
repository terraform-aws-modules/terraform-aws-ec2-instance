# Basic EC2 instance

Configuration in this directory creates EC2 instances with different sets of arguments (with Elastic IP, with network interface attached, with credit specifications).

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

No input.

## Outputs

| Name | Description |
|------|-------------|
| credit\_specification | Credit specification of EC2 instance (empty list for not t2 instance types) |
| credit\_specification\_t2\_unlimited | Credit specification of t2-type EC2 instance |
| ebs\_block\_device\_volume\_ids | List of volume IDs of EBS block devices of instances |
| ids | List of IDs of instances |
| ids\_t2 | List of IDs of t2-type instances |
| instance\_id | EC2 instance ID |
| instance\_public\_dns | Public DNS name assigned to the EC2 instance |
| placement\_group | List of placement group |
| public\_dns | List of public DNS names assigned to the instances |
| root\_block\_device\_volume\_ids | List of volume IDs of root block devices of instances |
| t2\_instance\_id | EC2 instance ID |
| tags | List of tags |
| vpc\_security\_group\_ids | List of VPC security group ids assigned to the instances |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
