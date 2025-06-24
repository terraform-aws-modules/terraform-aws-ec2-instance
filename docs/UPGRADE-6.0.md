# Upgrade from v5.x to v6.x

If you have any questions regarding this upgrade process, please consult the `examples` directory:

- [Complete](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/complete)

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Terraform v1.10.0 is now minimum supported version
- AWS provider v6.0.0 is now minimum supported version
- The default value for `ami_ssm_parameter` was changed from `"/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"` to `"/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"`. AL2 is approaching end of life.

## Additional changes

### Added

- Support for creating a security group within the module; this is now the default behavior and can be disabled by setting `create_security_group = false`.
- Support for `region` parameter to specify the AWS region for the resources created if different from the provider region.
- Support for tagging spot instances

### Modified

- Variable definitions now contain detailed `object` types in place of the previously used `any` type.
- Inline `ebs_block_device` argument has been removed in favor of `ebs_volumes` which is a map of EBS volumes created through `aws_ebs_volume` and `aws_ebs_volume_attachment` resources. This provides the same API as before, but allows for more flexibility without generating diffs when adding or removing EBS volumes as well as unintended changes to the volumes.
- Correct tag precedence ordering (least specific to most specific)

### Removed

- The `volume-attachment` example  has been removed since the module has been updated to use the corrected form of EBS volume creation and attachment (tl;dr - example is no longer useful).

### Variable and output changes

1. Removed variables:

   - `cpu_core_count` - removed from provider `v6.x`
   - `cpu_threads_per_core` - removed from provider `v6.x`

2. Renamed variables:

   - `ebs_block_device` -> `ebs_volumes`

3. Added variables:

   - `region`
   - `enable_primary_ipv6`
   - `host_resource_group_arn`
   - `instance_market_options`
   - `placement_partition_number`
   - `create_security_group`
   - `security_group_name`
   - `security_group_use_name_prefix`
   - `security_group_description`
   - `security_group_vpc_id`
   - `security_group_tags`
   - `security_group_egress_rules`
   - `security_group_ingress_rules`

4. Removed outputs:

   - None

5. Renamed outputs:

   - None

6. Added outputs:

   - `ebs_volumes`

## Upgrade State Migrations

### Before 5.x Example

```hcl
module "ec2_upgrade" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  # Truncated for brevity, only relevant module API changes are shown ...

  root_block_device = [
    {
      encrypted   = true
      volume_size = 50
      volume_type = "gp3"
      throughput  = 200
      tags = {
        Name = "my-root-block"
      }
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      encrypted   = true
      volume_size = 5
      volume_type = "gp3"
      throughput  = 200
      tags = {
        MountPoint = "/mnt/data"
      }
    }
  ]

  network_interface = [
    {
      device_index          = 0
      network_interface_id  = aws_network_interface.this.id
      delete_on_termination = false
    }
  ]

  tags = local.tags
}
```

### After 6.x Example

```hcl
module "ec2_upgrade" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.0"

  # Truncated for brevity, only relevant module API changes are shown ...

  # There can only be one root block device, so the wrapping list is removed
  root_block_device = {
    encrypted   = true
    size        = 50 # Was `volume_size`
    type        = "gp3" # Was `volume_type`
    throughput  = 200
    tags = {
      Name = "my-root-block"
    }
  }

  # Now a map of EBS volumes is used instead of a list
  ebs_volumes = {
    # The device_name can be the key of the map, or set by `device_name` attribute
    "/dev/sdf" = {
      encrypted  = true
      size       = 5 # Was `volume_size`
      type       = "gp3" # Was `volume_type`, `gp3` is now the default
      throughput = 200
      tags = {
        MountPoint = "/mnt/data"
      }
    }
  }

  # Now a map of network interfaces is used instead of a list
  network_interface = {
    # The device_index can be the key of the map, or set by `device_index` attribute
    0 = {
      network_interface_id  = aws_network_interface.this.id
      delete_on_termination = false
    }
  }

  tags = local.tags
}
```

To migrate from the `v5.x` version to `v6.x` version example shown above, the following state move commands can be performed to maintain the current resources without modification:

> [!NOTE]
> State move commands should only be required on instances that have additional EBS volumes attached to them.

```bash
terraform state rm 'module.ec2_complete.aws_instance.this[0]'
terraform import 'module.ec2_complete.aws_instance.this[0]' <INSTANCE_ID>

# Do the following for each additional EBS volume attached to the instance
terraform import 'module.ec2_complete.aws_ebs_volume.this["/dev/sdf"]' <VOLUME_ID>
terraform import 'module.ec2_complete.aws_volume_attachment.this["/dev/sdf"]' <DEVICE_NAME>:<VOLUME_ID>:<INSTANCE_ID>
```

> [!TIP]
> If you encounter a situation where Terraform wants to recreate the instance due to user data changes, you can set the `user_data_replace_on_change` variable to `false` to prevent this behavior.
> This is related to https://github.com/hashicorp/terraform-provider-aws/issues/5011
