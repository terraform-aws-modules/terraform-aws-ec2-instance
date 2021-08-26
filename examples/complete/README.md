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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.51 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_complete"></a> [ec2\_complete](#module\_ec2\_complete) | ../../ | n/a |
| <a name="module_ec2_disabled"></a> [ec2\_disabled](#module\_ec2\_disabled) | ../../ | n/a |
| <a name="module_ec2_metadata_options"></a> [ec2\_metadata\_options](#module\_ec2\_metadata\_options) | ../../ | n/a |
| <a name="module_ec2_network_interface"></a> [ec2\_network\_interface](#module\_ec2\_network\_interface) | ../../ | n/a |
| <a name="module_ec2_t2_unlimited"></a> [ec2\_t2\_unlimited](#module\_ec2\_t2\_unlimited) | ../../ | n/a |
| <a name="module_ec2_t3_unlimited"></a> [ec2\_t3\_unlimited](#module\_ec2\_t3\_unlimited) | ../../ | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_network_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_placement_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/placement_group) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_complete_arn"></a> [ec2\_complete\_arn](#output\_ec2\_complete\_arn) | The ARN of the instance |
| <a name="output_ec2_complete_capacity_reservation_specification"></a> [ec2\_complete\_capacity\_reservation\_specification](#output\_ec2\_complete\_capacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_complete_id"></a> [ec2\_complete\_id](#output\_ec2\_complete\_id) | The ID of the instance |
| <a name="output_ec2_complete_instance_state"></a> [ec2\_complete\_instance\_state](#output\_ec2\_complete\_instance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_complete_primary_network_interface_id"></a> [ec2\_complete\_primary\_network\_interface\_id](#output\_ec2\_complete\_primary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_complete_private_dns"></a> [ec2\_complete\_private\_dns](#output\_ec2\_complete\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_complete_public_dns"></a> [ec2\_complete\_public\_dns](#output\_ec2\_complete\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_complete_public_ip"></a> [ec2\_complete\_public\_ip](#output\_ec2\_complete\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_complete_tags_all"></a> [ec2\_complete\_tags\_all](#output\_ec2\_complete\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_ec2_t2_unlimitedarn"></a> [ec2\_t2\_unlimitedarn](#output\_ec2\_t2\_unlimitedarn) | The ARN of the instance |
| <a name="output_ec2_t2_unlimitedcapacity_reservation_specification"></a> [ec2\_t2\_unlimitedcapacity\_reservation\_specification](#output\_ec2\_t2\_unlimitedcapacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_t2_unlimitedid"></a> [ec2\_t2\_unlimitedid](#output\_ec2\_t2\_unlimitedid) | The ID of the instance |
| <a name="output_ec2_t2_unlimitedinstance_state"></a> [ec2\_t2\_unlimitedinstance\_state](#output\_ec2\_t2\_unlimitedinstance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_t2_unlimitedprimary_network_interface_id"></a> [ec2\_t2\_unlimitedprimary\_network\_interface\_id](#output\_ec2\_t2\_unlimitedprimary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_t2_unlimitedprivate_dns"></a> [ec2\_t2\_unlimitedprivate\_dns](#output\_ec2\_t2\_unlimitedprivate\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t2_unlimitedpublic_dns"></a> [ec2\_t2\_unlimitedpublic\_dns](#output\_ec2\_t2\_unlimitedpublic\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t2_unlimitedpublic_ip"></a> [ec2\_t2\_unlimitedpublic\_ip](#output\_ec2\_t2\_unlimitedpublic\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_t2_unlimitedtags_all"></a> [ec2\_t2\_unlimitedtags\_all](#output\_ec2\_t2\_unlimitedtags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_ec2_t3_unlimitedarn"></a> [ec2\_t3\_unlimitedarn](#output\_ec2\_t3\_unlimitedarn) | The ARN of the instance |
| <a name="output_ec2_t3_unlimitedcapacity_reservation_specification"></a> [ec2\_t3\_unlimitedcapacity\_reservation\_specification](#output\_ec2\_t3\_unlimitedcapacity\_reservation\_specification) | Capacity reservation specification of the instance |
| <a name="output_ec2_t3_unlimitedid"></a> [ec2\_t3\_unlimitedid](#output\_ec2\_t3\_unlimitedid) | The ID of the instance |
| <a name="output_ec2_t3_unlimitedinstance_state"></a> [ec2\_t3\_unlimitedinstance\_state](#output\_ec2\_t3\_unlimitedinstance\_state) | The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped` |
| <a name="output_ec2_t3_unlimitedprimary_network_interface_id"></a> [ec2\_t3\_unlimitedprimary\_network\_interface\_id](#output\_ec2\_t3\_unlimitedprimary\_network\_interface\_id) | The ID of the instance's primary network interface |
| <a name="output_ec2_t3_unlimitedprivate_dns"></a> [ec2\_t3\_unlimitedprivate\_dns](#output\_ec2\_t3\_unlimitedprivate\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t3_unlimitedpublic_dns"></a> [ec2\_t3\_unlimitedpublic\_dns](#output\_ec2\_t3\_unlimitedpublic\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_ec2_t3_unlimitedpublic_ip"></a> [ec2\_t3\_unlimitedpublic\_ip](#output\_ec2\_t3\_unlimitedpublic\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached |
| <a name="output_ec2_t3_unlimitedtags_all"></a> [ec2\_t3\_unlimitedtags\_all](#output\_ec2\_t3\_unlimitedtags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
