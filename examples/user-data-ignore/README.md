# EC2 instance with ignored user data changes

Configuration in this directory creates EC2 instances that demonstrate `ignore_user_data_changes`.

User data only runs on the first boot of an instance. Because of that, changing `user_data` on an existing instance does not re-run the script - it merely forces the instance to be restarted (or replaced entirely, when `user_data_replace_on_change` is `true`). Setting `ignore_user_data_changes = true` pins the user data to the value captured at creation, leaving running instances untouched.

Three instances are created:

- `user_data` with `ignore_user_data_changes = true`
- `user_data_base64` with `ignore_user_data_changes = true`
- `user_data` with `ignore_user_data_changes` left disabled (control)

After applying, edit `local.user_data` and run `terraform plan` again: only the control instance is updated.

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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.37 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.37 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_user_data"></a> [ec2\_user\_data](#module\_ec2\_user\_data) | ../../ | n/a |
| <a name="module_ec2_user_data_base64"></a> [ec2\_user\_data\_base64](#module\_ec2\_user\_data\_base64) | ../../ | n/a |
| <a name="module_ec2_user_data_not_ignored"></a> [ec2\_user\_data\_not\_ignored](#module\_ec2\_user\_data\_not\_ignored) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_subnets.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_data_base64_instance_id"></a> [user\_data\_base64\_instance\_id](#output\_user\_data\_base64\_instance\_id) | The ID of the instance created with `user_data_base64` and `ignore_user_data_changes` enabled |
| <a name="output_user_data_instance_id"></a> [user\_data\_instance\_id](#output\_user\_data\_instance\_id) | The ID of the instance created with `user_data` and `ignore_user_data_changes` enabled |
| <a name="output_user_data_not_ignored_instance_id"></a> [user\_data\_not\_ignored\_instance\_id](#output\_user\_data\_not\_ignored\_instance\_id) | The ID of the instance created with `user_data` and `ignore_user_data_changes` disabled |
<!-- END_TF_DOCS -->
