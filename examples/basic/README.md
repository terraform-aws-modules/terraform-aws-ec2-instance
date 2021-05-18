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
| <a name="module_ec2_with_metadata_options"></a> [ec2\_with\_metadata\_options](#module\_ec2\_with\_metadata\_options) | ../../ |  |
| <a name="module_ec2_with_network_interface"></a> [ec2\_with\_network\_interface](#module\_ec2\_with\_network\_interface) | ../../ |  |
| <a name="module_ec2_with_t2_unlimited"></a> [ec2\_with\_t2\_unlimited](#module\_ec2\_with\_t2\_unlimited) | ../../ |  |
| <a name="module_ec2_with_t3_unlimited"></a> [ec2\_with\_t3\_unlimited](#module\_ec2\_with\_t3\_unlimited) | ../../ |  |
| <a name="module_ec2_zero"></a> [ec2\_zero](#module\_ec2\_zero) | ../../ |  |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_network_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_placement_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/placement_group) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_credit_specification"></a> [credit\_specification](#output\_credit\_specification) | Credit specification of EC2 instance (empty list for not t2 instance types) |
| <a name="output_credit_specification_t2_unlimited"></a> [credit\_specification\_t2\_unlimited](#output\_credit\_specification\_t2\_unlimited) | Credit specification of t2-type EC2 instance |
| <a name="output_ebs_block_device_volume_ids"></a> [ebs\_block\_device\_volume\_ids](#output\_ebs\_block\_device\_volume\_ids) | List of volume IDs of EBS block devices of instances |
| <a name="output_ids"></a> [ids](#output\_ids) | List of IDs of instances |
| <a name="output_ids_t2"></a> [ids\_t2](#output\_ids\_t2) | List of IDs of t2-type instances |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | EC2 instance ID |
| <a name="output_instance_public_dns"></a> [instance\_public\_dns](#output\_instance\_public\_dns) | Public DNS name assigned to the EC2 instance |
| <a name="output_metadata_options"></a> [metadata\_options](#output\_metadata\_options) | Metadata options for the instance |
| <a name="output_metadata_options_custom"></a> [metadata\_options\_custom](#output\_metadata\_options\_custom) | Customized metadata options for the instance |
| <a name="output_placement_group"></a> [placement\_group](#output\_placement\_group) | List of placement group |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | List of public DNS names assigned to the instances |
| <a name="output_root_block_device_volume_ids"></a> [root\_block\_device\_volume\_ids](#output\_root\_block\_device\_volume\_ids) | List of volume IDs of root block devices of instances |
| <a name="output_t2_instance_id"></a> [t2\_instance\_id](#output\_t2\_instance\_id) | EC2 instance ID |
| <a name="output_tags"></a> [tags](#output\_tags) | List of tags |
| <a name="output_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#output\_vpc\_security\_group\_ids) | List of VPC security group ids assigned to the instances |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
