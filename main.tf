locals {
  is_t_instance_type          = replace(var.instance_type, "/^t[23]{1}\\..*$/", "1") == "1" ? true : false
  attached_block_device_count = length(var.attached_block_device)
  attached_block_device_total = var.instance_count * local.attached_block_device_count
  subnet_ids                  = distinct(compact(concat([var.subnet_id], var.subnet_ids)))
}

/*  =========================================================================
    Using subnets to determine the az instead of using calculated
    az information from aws_instance.
    This is necessary in order to prevent that the attached EBS volumes
    are destroyed when an EC2 instance is recreated.
    ========================================================================= */
data "aws_subnet" "this" {
  count = length(local.subnet_ids)

  id = local.subnet_ids[count.index]
}

######
# Note: network_interface can't be specified together with associate_public_ip_address
######
resource "aws_instance" "this" {
  count = var.instance_count

  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  subnet_id              = local.subnet_ids[count.index % length(local.subnet_ids)]
  key_name               = var.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
  private_ip                  = length(var.private_ips) > 0 ? element(var.private_ips, count.index) : var.private_ip
  ipv6_address_count          = var.ipv6_address_count
  ipv6_addresses              = var.ipv6_addresses

  ebs_optimized = var.ebs_optimized

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = lookup(ebs_block_device.value, "device_name", null)
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = lookup(ephemeral_block_device.value, "no_device", null)
      virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
    }
  }

  source_dest_check                    = var.source_dest_check
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  placement_group                      = var.placement_group
  tenancy                              = var.tenancy

  tags = merge(
    {
      Name = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.tags,
  )

  volume_tags = merge(
    {
      Name = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.volume_tags,
  )

  credit_specification {
    cpu_credits = local.is_t_instance_type ? var.cpu_credits : null
  }

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = [
      root_block_device,
      ebs_block_device,
    ]
  }
}

# iterate first over the instances and then over the attached EBS volumes
# => it is possible to increase and decrease the number of instances
# => it is not possible do add/remove additional volumes for all instances
resource "aws_ebs_volume" "this" {
  count = local.attached_block_device_total

  availability_zone = data.aws_subnet.this[
    floor(count.index / local.attached_block_device_count) % length(local.subnet_ids)
  ].availability_zone

  encrypted = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count
  ], "encrypted", null)

  iops = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count
  ], "iops", null)

  kms_key_id = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count

  ], "kms_key_id", null)

  size = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count

  ], "volume_size", null)

  snapshot_id = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count

  ], "snapshot_id", null)

  type = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count
  ], "volume_type", null)

  tags = merge(
    {
      Name = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, floor(count.index / local.attached_block_device_count) + 1) : var.name
    },
    var.volume_tags,
  )
}

resource "aws_volume_attachment" "this" {
  count = local.attached_block_device_total

  device_name = lookup(var.attached_block_device[
    count.index % local.attached_block_device_count
  ], "device_name", null)
  instance_id = aws_instance.this[
    floor(count.index / local.attached_block_device_count)
  ].id
  volume_id = aws_ebs_volume.this[count.index].id
}

