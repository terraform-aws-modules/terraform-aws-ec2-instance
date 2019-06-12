locals {
  credit_specification = replace(var.instance_type, "/^t[23]{1}\\..+$/", "1") == "1" ? [{cpu_credits = var.cpu_credits}] : []

  distinct_subnet_ids = distinct(compact(concat([var.subnet_id], var.subnet_ids)))
  subnet_ids_sorted_by_az   = values(zipmap(data.aws_subnet.details[*].availability_zone, data.aws_subnet.details[*].id))
}

data "aws_subnet" "details" {
  count = length(local.distinct_subnet_ids)
  id    = local.distinct_subnet_ids[count.index]
}

######
# Note: network_interface can't be specified together with associate_public_ip_address
######
resource "aws_instance" "this" {
  count = var.instance_count

  ami           = var.ami
  instance_type = var.instance_type
  user_data     = var.user_data
  key_name               = var.key_name
  monitoring             = var.monitoring
  iam_instance_profile   = var.iam_instance_profile

  associate_public_ip_address = var.associate_public_ip_address
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
      device_name           = ebs_block_device.value.device_name
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

  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  placement_group                      = var.placement_group
  tenancy                              = var.tenancy

  tags = merge(
    {
      "Name" = (var.instance_count > 1) || var.use_num_suffix ? (
        var.use_az_designation ? format(
          "%s%s%d%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          (count.index % length(local.distinct_subnet_ids)) + 1,
          floor(count.index / length(local.distinct_subnet_ids)) + 1,
        ) : format(
          "%s%s%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          count.index + 1,
        )
      ) : var.name
    },
    var.tags,
  )

  volume_tags = merge(
    {
      "Name" = (var.instance_count > 1) || var.use_num_suffix ? (
        var.use_az_designation ? format(
          "%s%s%d%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          (count.index % length(local.distinct_subnet_ids)) + 1,
          floor(count.index / length(local.distinct_subnet_ids)) + 1,
        ) : format(
          "%s%s%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          count.index + 1,
        )
      ) : var.name
    },
    var.volume_tags,
  )

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = [
      private_ip,
      root_block_device,
      ebs_block_device,
    ]
  }
  
  dynamic "credit_specification" {
    for_each = local.credit_specification
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }
  
  network_interface {
    network_interface_id = aws_network_interface.primary[count.index].id
    device_index         = 0
  }
}

resource "aws_network_interface" "primary" {
  count = var.instance_count

  subnet_id         = element(local.subnet_ids_sorted_by_az, count.index)
  description       = "Primary network interface"
  private_ips       = var.private_ip == "" ? null : [var.private_ip]
  security_groups   = var.vpc_security_group_ids
  source_dest_check = var.source_dest_check

  tags = merge(
    {
      "Name" = (var.instance_count > 1) || var.use_num_suffix ? (
        var.use_az_designation ? format(
          "%s%s%d%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          (count.index % length(local.distinct_subnet_ids)) + 1,
          floor(count.index / length(local.distinct_subnet_ids)) + 1,
        ) : format(
          "%s%s%0${var.num_suffix_width}d",
          var.name,
          var.num_suffix_delimiter,
          count.index + 1,
        )
      ) : var.name
    },
    var.network_interface_tags,
  )
}

