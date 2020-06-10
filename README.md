# AWS EC2 Instance Terraform module

Terraform module which creates EC2 instance(s) on AWS.

These types of resources are supported:

* [EC2 instance](https://www.terraform.io/docs/providers/aws/r/instance.html)

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 5

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

* [Basic EC2 instance](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/basic)
* [EC2 instance with EBS volume attachment](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/volume-attachment)

## Make an encrypted AMI for use

This module does not support encrypted AMI's out of the box however it is easy enough for you to generate one for use

This example creates an encrypted image from the latest ubuntu 16.04 base image.


```hcl
resource "aws_ami_copy" "ubuntu-xenial-encrypted-ami" {
  name              = "ubuntu-xenial-encrypted-ami"
  description       = "An encrypted root ami based off ${data.aws_ami.ubuntu-xenial.id}"
  source_ami_id     = "${data.aws_ami.ubuntu-xenial.id}"
  source_ami_region = "eu-west-2"
  encrypted         = "true"

  tags {
    Name = "ubuntu-xenial-encrypted-ami"
  }
}

data "aws_ami" "encrypted-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-xenial-encrypted"]
  }

  owners = ["self"]
}

data "aws_ami" "ubuntu-xenial" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  owners      = ["099720109477"]
}
```


## Notes

* `network_interface` can't be specified together with `vpc_security_group_ids`, `associate_public_ip_address`, `subnet_id`. See [basic example](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/basic) for details. 
* Changes in `ebs_block_device` argument will be ignored. Use [aws_volume_attachment](https://www.terraform.io/docs/providers/aws/r/volume_attachment.html) resource to attach and detach volumes from AWS EC2 instances. See [this example](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/volume-attachment).
* One of `subnet_id` or `subnet_ids` is required. If both are provided, the value of `subnet_id` is prepended to the value of `subnet_ids`.

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
| ami | ID of AMI to use for the instance | `string` | n/a | yes |
| associate\_public\_ip\_address | If true, the EC2 instance will have associated public IP address | `bool` | `null` | no |
| cpu\_credits | The credit option for CPU usage (unlimited or standard) | `string` | `"standard"` | no |
| disable\_api\_termination | If true, enables EC2 Instance Termination Protection | `bool` | `false` | no |
| ebs\_block\_device | Additional EBS block devices to attach to the instance | `list(map(string))` | `[]` | no |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized | `bool` | `false` | no |
| ephemeral\_block\_device | Customize Ephemeral (also known as Instance Store) volumes on the instance | `list(map(string))` | `[]` | no |
| get\_password\_data | If true, wait for password data to become available and retrieve it. | `bool` | `false` | no |
| iam\_instance\_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | `string` | `""` | no |
| instance\_count | Number of instances to launch | `number` | `1` | no |
| instance\_initiated\_shutdown\_behavior | Shutdown behavior for the instance | `string` | `""` | no |
| instance\_type | The type of instance to start | `string` | n/a | yes |
| ipv6\_address\_count | A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet. | `number` | `null` | no |
| ipv6\_addresses | Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface | `list(string)` | `null` | no |
| key\_name | The key name to use for the instance | `string` | `""` | no |
| monitoring | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| name | Name to be used on all resources as prefix | `string` | n/a | yes |
| network\_interface | Customize network interfaces to be attached at instance boot time | `list(map(string))` | `[]` | no |
| num\_suffix\_format | Numerical suffix format used as the volume and EC2 instance name suffix | `string` | `"-%d"` | no |
| placement\_group | The Placement Group to start the instance in | `string` | `""` | no |
| private\_ip | Private IP address to associate with the instance in a VPC | `string` | `null` | no |
| private\_ips | A list of private IP address to associate with the instance in a VPC. Should match the number of instances. | `list(string)` | `[]` | no |
| root\_block\_device | Customize details about the root block device of the instance. See Block Devices below for details | `list(map(string))` | `[]` | no |
| source\_dest\_check | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. | `bool` | `true` | no |
| subnet\_id | The VPC Subnet ID to launch in | `string` | `""` | no |
| subnet\_ids | A list of VPC Subnet IDs to launch in | `list(string)` | `[]` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| tenancy | The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host. | `string` | `"default"` | no |
| use\_num\_suffix | Always append numerical suffix to instance name, even if instance\_count is 1 | `bool` | `false` | no |
| user\_data | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `string` | `null` | no |
| user\_data\_base64 | Can be used instead of user\_data to pass base64-encoded binary data directly. Use this instead of user\_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. | `string` | `null` | no |
| volume\_tags | A mapping of tags to assign to the devices created by the instance at launch time | `map(string)` | `{}` | no |
| vpc\_security\_group\_ids | A list of security group IDs to associate with | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | List of ARNs of instances |
| availability\_zone | List of availability zones of instances |
| credit\_specification | List of credit specification of instances |
| ebs\_block\_device\_volume\_ids | List of volume IDs of EBS block devices of instances |
| id | List of IDs of instances |
| instance\_count | Number of instances to launch specified as argument to this module |
| instance\_state | List of instance states of instances |
| ipv6\_addresses | List of assigned IPv6 addresses of instances |
| key\_name | List of key names of instances |
| password\_data | List of Base-64 encoded encrypted password data for the instance |
| placement\_group | List of placement groups of instances |
| primary\_network\_interface\_id | List of IDs of the primary network interface of instances |
| private\_dns | List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| private\_ip | List of private IP addresses assigned to the instances |
| public\_dns | List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| public\_ip | List of public IP addresses assigned to the instances, if applicable |
| root\_block\_device\_volume\_ids | List of volume IDs of root block devices of instances |
| security\_groups | List of associated security groups of instances |
| subnet\_id | List of IDs of VPC subnets of instances |
| tags | List of tags of instances |
| volume\_tags | List of tags of volumes of instances |
| vpc\_security\_group\_ids | List of associated security groups of instances, if running in non-default VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
