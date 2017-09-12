provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

module "ec2" {
  source = "../../"

  name          = "example"
  ami           = "${data.aws_ami.amazon_linux.id}"
  instance_type = "t2.micro"
}
