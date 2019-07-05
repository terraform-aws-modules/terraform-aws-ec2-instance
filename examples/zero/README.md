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

