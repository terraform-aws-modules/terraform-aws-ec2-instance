# Wrapper for the root module

The configuration in this directory contains an implementation of a single module wrapper pattern, which allows managing several copies of a module in places where using the native Terraform 0.13+ `for_each` feature is not feasible (e.g., with Terragrunt).

You may want to use a single Terragrunt configuration file to manage multiple resources without duplicating `terragrunt.hcl` files for each copy of the same module.

This wrapper does not implement any extra functionality.

## Usage with Terragrunt

`terragrunt.hcl`:

```hcl
terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=master//wrappers"
}

inputs = {
  items = {
    my-item = {
      # omitted... can be any argument supported by the module
    }
    my-second-item = {
      # omitted... can be any argument supported by the module
    }
    # omitted...
  }
}
```

## Usage with Terraform:

```hcl
module "wrapper" {
  source = "terraform-aws-modules/ec2-instance/aws//wrappers"

  items = {
    my-item = {
      # omitted... can be any argument supported by the module
    }
    my-second-item = {
      # omitted... can be any argument supported by the module
    }
    # omitted...
  }
}
```

## Example: Manage multiple EC2 instances in one Terragrunt layer

`eu-west-1/ec2-instances/terragrunt.hcl`:

```hcl
terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=master//wrappers"
}

inputs = {
  items = {
    instance1 = {
      name = "my-random-instance-1"
      ami  = "ami-0123456789abcdef0"
    }
    instance2 = {
      name = "my-random-instance-2"
      ami  = "ami-fedcba9876543210f"
    }
  }
}
```

