# AWS EC2 Instance Terraform module

Terraform module which creates EC2 instance(s) on AWS.

These types of resources are supported:

* [EC2 instance](https://www.terraform.io/docs/providers/aws/r/instance.html) 

## Usage

```hcl
module "ec2_cluster" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "my-cluster"
  instance_count = 5
  
  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

## Examples

* [Basic EC2 instance](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/basic)
* [EC2 instance with EBS volume attachment](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/volume-attachment)

## Make an encrypted AMI for use

This module does not sopport encrypted AMI's out of the box however it is easy enough for you to generate one for use

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
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}
```


## Notes

* `network_interface` can't be specified together with `associate_public_ip_address`, which makes `network_interface`
  not configurable using this module at the moment
* Changes in `ebs_block_device` argument will be ignored. Use [aws_volume_attachment](https://www.terraform.io/docs/providers/aws/r/volume_attachment.html) resource to attach and detach volumes from AWS EC2 instances. See [this example](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/volume-attachment).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami | ID of AMI to use for the instance | string | - | yes |
| associate_public_ip_address | If true, the EC2 instance will have associated public IP address | string | `false` | no |
| cpu_credits | The credit option for CPU usage (unlimited or standard) | string | `standard` | no |
| disable_api_termination | If true, enables EC2 Instance Termination Protection | string | `false` | no |
| ebs_block_device | Additional EBS block devices to attach to the instance | string | `<list>` | no |
| ebs_optimized | If true, the launched EC2 instance will be EBS-optimized | string | `false` | no |
| ephemeral_block_device | Customize Ephemeral (also known as Instance Store) volumes on the instance | string | `<list>` | no |
| iam_instance_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | string | `` | no |
| instance_count | Number of instances to launch | string | `1` | no |
| instance_initiated_shutdown_behavior | Shutdown behavior for the instance | string | `` | no |
| instance_type | The type of instance to start | string | - | yes |
| ipv6_address_count | A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet. | string | `0` | no |
| ipv6_addresses | Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface | string | `<list>` | no |
| key_name | The key name to use for the instance | string | `` | no |
| monitoring | If true, the launched EC2 instance will have detailed monitoring enabled | string | `false` | no |
| name | Name to be used on all resources as prefix | string | - | yes |
| network_interface | Customize network interfaces to be attached at instance boot time | string | `<list>` | no |
| placement_group | The Placement Group to start the instance in | string | `` | no |
| private_ip | Private IP address to associate with the instance in a VPC | string | `` | no |
| root_block_device | Customize details about the root block device of the instance. See Block Devices below for details | string | `<list>` | no |
| source_dest_check | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. | string | `true` | no |
| subnet_id | The VPC Subnet ID to launch in | string | - | yes |
| tags | A mapping of tags to assign to the resource | string | `<map>` | no |
| tenancy | The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host. | string | `default` | no |
| user_data | The user data to provide when launching the instance | string | `` | no |
| volume_tags | A mapping of tags to assign to the devices created by the instance at launch time | string | `<map>` | no |
| vpc_security_group_ids | A list of security group IDs to associate with | list | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| availability_zone | List of availability zones of instances |
| credit_specification | List of credit specification of instances |
| id | List of IDs of instances |
| key_name | List of key names of instances |
| network_interface_id | List of IDs of the network interface of instances |
| primary_network_interface_id | List of IDs of the primary network interface of instances |
| private_dns | List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| private_ip | List of private IP addresses assigned to the instances |
| public_dns | List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| public_ip | List of public IP addresses assigned to the instances, if applicable |
| security_groups | List of associated security groups of instances |
| subnet_id | List of IDs of VPC subnets of instances |
| tags | List of tags of instances |
| vpc_security_group_ids | List of associated security groups of instances, if running in non-default VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
