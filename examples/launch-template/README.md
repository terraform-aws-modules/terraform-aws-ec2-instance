# EC2 instance with Launch template

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_from_launch_template"></a> [ec2\_from\_launch\_template](#module\_ec2\_from\_launch\_template) | ../../ | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.tf_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [tls_private_key.ed25519](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.amazon_linux_23](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_arn"></a> [ec2\_arn](#output\_ec2\_arn) | The ARN of the instance |
| <a name="output_ec2_availability_zone"></a> [ec2\_availability\_zone](#output\_ec2\_availability\_zone) | The availability zone of the created instance |
| <a name="output_ec2_capacity_reservation_specification"></a> [ec2\_capacity\_reservation\_specification](#output\_ec2\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_ebs_block_device"></a> [ec2\_ebs\_block\_device](#output\_ec2\_ebs\_block\_device) | EBS block device information |
| <a name="output_ec2_ephemeral_block_device"></a> [ec2\_ephemeral\_block\_device](#output\_ec2\_ephemeral\_block\_device) | Ephemeral block device information |
| <a name="output_ec2_iam_instance_profile_arn"></a> [ec2\_iam\_instance\_profile\_arn](#output\_ec2\_iam\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile |
| <a name="output_ec2_iam_instance_profile_id"></a> [ec2\_iam\_instance\_profile\_id](#output\_ec2\_iam\_instance\_profile\_id) | Instance profile's ID |
| <a name="output_ec2_iam_instance_profile_unique"></a> [ec2\_iam\_instance\_profile\_unique](#output\_ec2\_iam\_instance\_profile\_unique) | Stable and unique string identifying the IAM instance profile |
| <a name="output_ec2_iam_role_arn"></a> [ec2\_iam\_role\_arn](#output\_ec2\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the IAM role |
| <a name="output_ec2_iam_role_name"></a> [ec2\_iam\_role\_name](#output\_ec2\_iam\_role\_name) | The name of the IAM role |
| <a name="output_ec2_iam_role_unique_id"></a> [ec2\_iam\_role\_unique\_id](#output\_ec2\_iam\_role\_unique\_id) | Stable and unique string identifying the IAM role |
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | The ID of the instance |
| <a name="output_ec2_instance_state"></a> [ec2\_instance\_state](#output\_ec2\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_primary_network_interface_id"></a> [ec2\_primary\_network\_interface\_id](#output\_ec2\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_private_dns"></a> [ec2\_private\_dns](#output\_ec2\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_public_dns"></a> [ec2\_public\_dns](#output\_ec2\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_root_block_device"></a> [ec2\_root\_block\_device](#output\_ec2\_root\_block\_device) | Root block device information |
| <a name="output_ec2_tags_all"></a> [ec2\_tags\_all](#output\_ec2\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
