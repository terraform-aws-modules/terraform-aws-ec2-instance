AWS EC2 Spot Instance Request Terraform module
=================================

Terraform module which creates EC2 Spot Request request(s) on AWS.

These types of resources are supported:

* [EC2 Spot Instance Request](https://www.terraform.io/docs/providers/aws/r/spot_instance_request.html)

Usage
-----

```hcl
module "ec2_spot_cluster" {
  source = "johnypony3/ec2-spot-instance/aws"

  name  = "my-cluster"
  count = 5

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  spot_price             = "0.03"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

Examples
--------

* [Basic EC2 Spot instance](https://github.com/johnypony3/terraform-aws-ec2-spot-instance/tree/master/examples/spot)

Limitations
-----------

* `network_interface` can't be specified together with `associate_public_ip_address`, which makes `network_interface`
  not configurable using this module at the moment

Authors
-------

Module based on the work of [Anton Babenko](https://github.com/antonbabenko).
Written and managed by [johnypony3](https://github.com/johnypony3)
License
-------

Apache 2 Licensed. See LICENSE for full details.
