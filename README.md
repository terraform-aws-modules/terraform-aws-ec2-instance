AWS EC2 Terraform module
========================

Terraform module which creates EC2 instance(s) on AWS.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
* [Subnet](https://www.terraform.io/docs/providers/aws/r/aws_subnet.html)
* [Route](https://www.terraform.io/docs/providers/aws/r/route.html)
* [Route table](https://www.terraform.io/docs/providers/aws/r/route_table.html)
* [Internet Gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html) 
* [NAT Gateway](https://www.terraform.io/docs/providers/aws/r/nat_gateway.html)
* [VPC Endpoint](https://www.terraform.io/docs/providers/aws/r/vpc_endpoint.html) (S3 and DynamoDB)
* [RDS DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html) 
* [ElastiCache Subnet Group](https://www.terraform.io/docs/providers/aws/r/elasticache_subnet_group.html) 

Usage
-----

```hcl
module "ec2" {
  source = "terraform-aws-modules/ec2/aws"

  name  = "my-cluster"
  count = 5
  
  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

Examples
========

* [Basic EC2 instance](examples/basic)

Authors
=======

Module managed by [Anton Babenko](https://github.com/antonbabenko).

License
=======

Apache 2 Licensed. See LICENSE for full details.