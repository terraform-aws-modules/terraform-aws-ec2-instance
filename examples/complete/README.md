# Complete EC2 instance

Configuration in this directory creates EC2 instances with different sets of arguments (with Elastic IP, with network interface attached, with credit specifications).

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_complete"></a> [ec2\_complete](#module\_ec2\_complete) | ../../ | n/a |
| <a name="module_ec2_disabled"></a> [ec2\_disabled](#module\_ec2\_disabled) | ../../ | n/a |
| <a name="module_ec2_ignore_ami_changes"></a> [ec2\_ignore\_ami\_changes](#module\_ec2\_ignore\_ami\_changes) | ../../ | n/a |
| <a name="module_ec2_metadata_options"></a> [ec2\_metadata\_options](#module\_ec2\_metadata\_options) | ../../ | n/a |
| <a name="module_ec2_multiple"></a> [ec2\_multiple](#module\_ec2\_multiple) | ../../ | n/a |
| <a name="module_ec2_network_interface"></a> [ec2\_network\_interface](#module\_ec2\_network\_interface) | ../../ | n/a |
| <a name="module_ec2_open_capacity_reservation"></a> [ec2\_open\_capacity\_reservation](#module\_ec2\_open\_capacity\_reservation) | ../../ | n/a |
| <a name="module_ec2_spot_instance"></a> [ec2\_spot\_instance](#module\_ec2\_spot\_instance) | ../../ | n/a |
| <a name="module_ec2_t2_unlimited"></a> [ec2\_t2\_unlimited](#module\_ec2\_t2\_unlimited) | ../../ | n/a |
| <a name="module_ec2_t3_unlimited"></a> [ec2\_t3\_unlimited](#module\_ec2\_t3\_unlimited) | ../../ | n/a |
| <a name="module_ec2_targeted_capacity_reservation"></a> [ec2\_targeted\_capacity\_reservation](#module\_ec2\_targeted\_capacity\_reservation) | ../../ | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_capacity_reservation.open](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_capacity_reservation) | resource |
| [aws_ec2_capacity_reservation.targeted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_capacity_reservation) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_network_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_placement_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/placement_group) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_complete_arn"></a> [ec2\_complete\_arn](#output\_ec2\_complete\_arn) | The ARN of the instance |
| <a name="output_ec2_complete_availability_zone"></a> [ec2\_complete\_availability\_zone](#output\_ec2\_complete\_availability\_zone) | The availability zone of the created instance |
| <a name="output_ec2_complete_capacity_reservation_specification"></a> [ec2\_complete\_capacity\_reservation\_specification](#output\_ec2\_complete\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_complete_ebs_block_device"></a> [ec2\_complete\_ebs\_block\_device](#output\_ec2\_complete\_ebs\_block\_device) | EBS block device information |
| <a name="output_ec2_complete_ephemeral_block_device"></a> [ec2\_complete\_ephemeral\_block\_device](#output\_ec2\_complete\_ephemeral\_block\_device) | Ephemeral block device information |
| <a name="output_ec2_complete_iam_instance_profile_arn"></a> [ec2\_complete\_iam\_instance\_profile\_arn](#output\_ec2\_complete\_iam\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile |
| <a name="output_ec2_complete_iam_instance_profile_id"></a> [ec2\_complete\_iam\_instance\_profile\_id](#output\_ec2\_complete\_iam\_instance\_profile\_id) | Instance profile's ID |
| <a name="output_ec2_complete_iam_instance_profile_unique"></a> [ec2\_complete\_iam\_instance\_profile\_unique](#output\_ec2\_complete\_iam\_instance\_profile\_unique) | Stable and unique string identifying the IAM instance profile |
| <a name="output_ec2_complete_iam_role_arn"></a> [ec2\_complete\_iam\_role\_arn](#output\_ec2\_complete\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the IAM role |
| <a name="output_ec2_complete_iam_role_name"></a> [ec2\_complete\_iam\_role\_name](#output\_ec2\_complete\_iam\_role\_name) | The name of the IAM role |
| <a name="output_ec2_complete_iam_role_unique_id"></a> [ec2\_complete\_iam\_role\_unique\_id](#output\_ec2\_complete\_iam\_role\_unique\_id) | Stable and unique string identifying the IAM role |
| <a name="output_ec2_complete_id"></a> [ec2\_complete\_id](#output\_ec2\_complete\_id) | The ID of the instance |
| <a name="output_ec2_complete_instance_state"></a> [ec2\_complete\_instance\_state](#output\_ec2\_complete\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_complete_primary_network_interface_id"></a> [ec2\_complete\_primary\_network\_interface\_id](#output\_ec2\_complete\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_complete_private_dns"></a> [ec2\_complete\_private\_dns](#output\_ec2\_complete\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_complete_public_dns"></a> [ec2\_complete\_public\_dns](#output\_ec2\_complete\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_complete_public_ip"></a> [ec2\_complete\_public\_ip](#output\_ec2\_complete\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_complete_root_block_device"></a> [ec2\_complete\_root\_block\_device](#output\_ec2\_complete\_root\_block\_device) | Root block device information |
| <a name="output_ec2_complete_tags_all"></a> [ec2\_complete\_tags\_all](#output\_ec2\_complete\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_ec2_ignore_ami_changes_ami"></a> [ec2\_ignore\_ami\_changes\_ami](#output\_ec2\_ignore\_ami\_changes\_ami) | The AMI of the instance (ignore\_ami\_changes = true) |
| <a name="output_ec2_multiple"></a> [ec2\_multiple](#output\_ec2\_multiple) | The full output of the `ec2_module` module |
| <a name="output_ec2_spot_instance_arn"></a> [ec2\_spot\_instance\_arn](#output\_ec2\_spot\_instance\_arn) | The ARN of the instance |
| <a name="output_ec2_spot_instance_capacity_reservation_specification"></a> [ec2\_spot\_instance\_capacity\_reservation\_specification](#output\_ec2\_spot\_instance\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_spot_instance_id"></a> [ec2\_spot\_instance\_id](#output\_ec2\_spot\_instance\_id) | The ID of the instance |
| <a name="output_ec2_spot_instance_instance_state"></a> [ec2\_spot\_instance\_instance\_state](#output\_ec2\_spot\_instance\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_spot_instance_primary_network_interface_id"></a> [ec2\_spot\_instance\_primary\_network\_interface\_id](#output\_ec2\_spot\_instance\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_spot_instance_private_dns"></a> [ec2\_spot\_instance\_private\_dns](#output\_ec2\_spot\_instance\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_spot_instance_public_dns"></a> [ec2\_spot\_instance\_public\_dns](#output\_ec2\_spot\_instance\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_spot_instance_public_ip"></a> [ec2\_spot\_instance\_public\_ip](#output\_ec2\_spot\_instance\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_spot_instance_tags_all"></a> [ec2\_spot\_instance\_tags\_all](#output\_ec2\_spot\_instance\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_ec2_t2_unlimited_arn"></a> [ec2\_t2\_unlimited\_arn](#output\_ec2\_t2\_unlimited\_arn) | The ARN of the instance |
| <a name="output_ec2_t2_unlimited_availability_zone"></a> [ec2\_t2\_unlimited\_availability\_zone](#output\_ec2\_t2\_unlimited\_availability\_zone) | The availability zone of the created instance |
| <a name="output_ec2_t2_unlimited_capacity_reservation_specification"></a> [ec2\_t2\_unlimited\_capacity\_reservation\_specification](#output\_ec2\_t2\_unlimited\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_t2_unlimited_id"></a> [ec2\_t2\_unlimited\_id](#output\_ec2\_t2\_unlimited\_id) | The ID of the instance |
| <a name="output_ec2_t2_unlimited_instance_state"></a> [ec2\_t2\_unlimited\_instance\_state](#output\_ec2\_t2\_unlimited\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_t2_unlimited_primary_network_interface_id"></a> [ec2\_t2\_unlimited\_primary\_network\_interface\_id](#output\_ec2\_t2\_unlimited\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_t2_unlimited_private_dns"></a> [ec2\_t2\_unlimited\_private\_dns](#output\_ec2\_t2\_unlimited\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t2_unlimited_public_dns"></a> [ec2\_t2\_unlimited\_public\_dns](#output\_ec2\_t2\_unlimited\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t2_unlimited_public_ip"></a> [ec2\_t2\_unlimited\_public\_ip](#output\_ec2\_t2\_unlimited\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_t2_unlimited_tags_all"></a> [ec2\_t2\_unlimited\_tags\_all](#output\_ec2\_t2\_unlimited\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_ec2_t3_unlimited_arn"></a> [ec2\_t3\_unlimited\_arn](#output\_ec2\_t3\_unlimited\_arn) | The ARN of the instance |
| <a name="output_ec2_t3_unlimited_availability_zone"></a> [ec2\_t3\_unlimited\_availability\_zone](#output\_ec2\_t3\_unlimited\_availability\_zone) | The availability zone of the created instance |
| <a name="output_ec2_t3_unlimited_capacity_reservation_specification"></a> [ec2\_t3\_unlimited\_capacity\_reservation\_specification](#output\_ec2\_t3\_unlimited\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_t3_unlimited_id"></a> [ec2\_t3\_unlimited\_id](#output\_ec2\_t3\_unlimited\_id) | The ID of the instance |
| <a name="output_ec2_t3_unlimited_instance_state"></a> [ec2\_t3\_unlimited\_instance\_state](#output\_ec2\_t3\_unlimited\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_t3_unlimited_primary_network_interface_id"></a> [ec2\_t3\_unlimited\_primary\_network\_interface\_id](#output\_ec2\_t3\_unlimited\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_t3_unlimited_private_dns"></a> [ec2\_t3\_unlimited\_private\_dns](#output\_ec2\_t3\_unlimited\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t3_unlimited_public_dns"></a> [ec2\_t3\_unlimited\_public\_dns](#output\_ec2\_t3\_unlimited\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t3_unlimited_public_ip"></a> [ec2\_t3\_unlimited\_public\_ip](#output\_ec2\_t3\_unlimited\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_t3_unlimited_tags_all"></a> [ec2\_t3\_unlimited\_tags\_all](#output\_ec2\_t3\_unlimited\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_spot_bid_status"></a> [spot\_bid\_status](#output\_spot\_bid\_status) | The current bid status of the Spot Instance Request |
| <a name="output_spot_instance_availability_zone"></a> [spot\_instance\_availability\_zone](#output\_spot\_instance\_availability\_zone) | The availability zone of the created spot instance |
| <a name="output_spot_instance_id"></a> [spot\_instance\_id](#output\_spot\_instance\_id) | The Instance ID (if any) that is currently fulfilling the Spot Instance request |
| <a name="output_spot_request_state"></a> [spot\_request\_state](#output\_spot\_request\_state) | The current request state of the Spot Instance Request |
<!-- END_TF_DOCS -->
