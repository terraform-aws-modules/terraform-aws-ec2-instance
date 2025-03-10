module "instance" {
  source = "../../"

  application            = "exampleapp"
  environment            = "dev"
  ami_os                 = "Amazon_Linux"
  instance_type          = "r5.large"
  key_name               = "example_key"
  vpc_security_group_ids = ["sg-07b4edce8a1a6eb24"]
  subnet_id              = "subnet-067f45f707b2dc297"
  root_block_device = [
    {
      encrypted  = true
      kms_key_id = "arn:aws:kms:us-east-1:521938783116:key/e3203821-6efd-4848-9a8c-50a9990e06cd"
    }
  ]
}

