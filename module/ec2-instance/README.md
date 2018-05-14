AWS EC2 Instance Terraform module
=================================

Terraform module which creates EC2 instance(s) on AWS.

These types of resources are supported:

* [EC2 instance](https://www.terraform.io/docs/providers/aws/r/instance.html) 

Usage
-----

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

Examples
--------

* [Basic EC2 instance](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/basic)

Limitations
-----------

* `network_interface` can't be specified together with `associate_public_ip_address`, which makes `network_interface`
  not configurable using this module at the moment

Authors
-------

Module managed by [Anton Babenko](https://github.com/antonbabenko).

License
-------

Apache 2 Licensed. See LICENSE for full details.
