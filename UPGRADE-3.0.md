# Upgrade from v2.x to v3.x

If you have any questions regarding this upgrade process, please consult the `examples` directory:

- [Complete](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/complete)
- [Volume Attachment](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/tree/master/examples/volume-attachment)

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Terraform v0.13.1 is now minimum supported version to take advantage of `count` and `for_each` arguments at module level

### Variable and output changes

1. Removed variables:

   - `instance_count`
   - `subnet_ids` (only need to use `subnet_id` now)
   - `private_ips` (only need to use `private_ip` now)
   - `use_num_suffix`
   - `num_suffix_format`

2. Renamed variables:

   - `tags` -> `tags_all`

3. Removed outputs:

  - `availability_zone`
  - `placement_group`
  - `key_name`
  - `ipv6_addresses`
  - `private_ip`
  - `security_groups`
  - `vpc_security_group_ids`
  - `subnet_id`
  - `credit_specification`
  - `metadata_options`
  - `root_block_device_volume_ids`
  - `ebs_block_device_volume_ids`
  - `volume_tags`
  - `instance_count`

4. Renamed outputs:

   :info: All outputs used to be lists, and are now singular outputs due to the removal of `count`
