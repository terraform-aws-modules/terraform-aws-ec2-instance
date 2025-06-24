data "aws_partition" "current" {}

locals {
  create = var.create && var.putin_khuylo

  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a|4g){1}\\..*$/", "1") == "1" ? true : false

  ami = try(coalesce(var.ami, try(nonsensitive(data.aws_ssm_parameter.this[0].value), null)), null)

  instance_tags = merge(
    var.tags,
    var.instance_tags,
    { "Name" = var.name },
  )

  instance_id = try(
    aws_instance.this[0].id,
    aws_instance.ignore_ami[0].id,
    aws_spot_instance_request.this[0].spot_instance_id,
    null,
  )

  instance_availability_zone = try(
    aws_instance.this[0].availability_zone,
    aws_instance.ignore_ami[0].availability_zone,
    aws_spot_instance_request.this[0].availability_zone,
    null,
  )
}

data "aws_ssm_parameter" "this" {
  count = local.create && var.ami == null ? 1 : 0

  region = var.region

  name = var.ami_ssm_parameter
}

################################################################################
# Instance
################################################################################

resource "aws_instance" "this" {
  count = local.create && !var.ignore_ami_changes && !var.create_spot_instance ? 1 : 0

  region = var.region

  ami                         = local.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification != null ? [var.capacity_reservation_specification] : []

    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference

      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? [capacity_reservation_specification.value.capacity_reservation_target] : []

        content {
          capacity_reservation_id                 = capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_target.value.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options != null ? [var.cpu_options] : []

    content {
      amd_sev_snp      = cpu_options.value.amd_sev_snp
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  credit_specification {
    cpu_credits = local.is_t_instance_type ? var.cpu_credits : null
  }

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  # `ebs_block_device` managed by separate resource

  ebs_optimized = var.ebs_optimized

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  enable_primary_ipv6 = var.enable_primary_ipv6

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device != null ? var.ephemeral_block_device : {}

    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  host_resource_group_arn              = var.host_resource_group_arn
  iam_instance_profile                 = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  dynamic "instance_market_options" {
    for_each = var.instance_market_options != null ? [var.instance_market_options] : []

    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = instance_market_options.value.spot_options != null ? [instance_market_options.value.spot_options] : []

        content {
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior
          max_price                      = spot_options.value.max_price
          spot_instance_type             = spot_options.value.spot_instance_type
          valid_until                    = spot_options.value.valid_until
        }
      }
    }
  }

  instance_type      = var.instance_type
  ipv6_address_count = var.ipv6_address_count
  ipv6_addresses     = var.ipv6_addresses
  key_name           = var.key_name

  dynamic "launch_template" {
    for_each = var.launch_template != null ? [var.launch_template] : []

    content {
      id      = launch_template.value.id
      name    = launch_template.value.name
      version = launch_template.value.version
    }
  }

  dynamic "maintenance_options" {
    for_each = var.maintenance_options != null ? [var.maintenance_options] : []

    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []

    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags
    }
  }

  monitoring = var.monitoring

  dynamic "network_interface" {
    for_each = var.network_interface != null ? var.network_interface : {}

    content {
      delete_on_termination = network_interface.value.delete_on_termination
      device_index          = coalesce(network_interface.value.device_index, network_interface.key)
      network_card_index    = network_interface.value.network_card_index
      network_interface_id  = network_interface.value.network_interface_id

    }
  }

  placement_group            = var.placement_group
  placement_partition_number = var.placement_partition_number

  dynamic "private_dns_name_options" {
    for_each = var.private_dns_name_options != null ? [var.private_dns_name_options] : []

    content {
      enable_resource_name_dns_aaaa_record = private_dns_name_options.value.enable_resource_name_dns_aaaa_record
      enable_resource_name_dns_a_record    = private_dns_name_options.value.enable_resource_name_dns_a_record
      hostname_type                        = private_dns_name_options.value.hostname_type
    }
  }

  private_ip = var.private_ip

  dynamic "root_block_device" {
    for_each = var.root_block_device != null ? [var.root_block_device] : []

    content {
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted             = root_block_device.value.encrypted
      iops                  = root_block_device.value.iops
      kms_key_id            = root_block_device.value.kms_key_id
      tags                  = root_block_device.value.tags
      throughput            = root_block_device.value.throughput
      volume_size           = root_block_device.value.size
      volume_type           = root_block_device.value.type
    }
  }

  secondary_private_ips       = var.secondary_private_ips
  source_dest_check           = var.network_interface != null ? null : var.source_dest_check
  subnet_id                   = var.subnet_id
  tags                        = local.instance_tags
  tenancy                     = var.tenancy
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change
  volume_tags                 = var.enable_volume_tags ? merge(var.tags, var.volume_tags, { "Name" = var.name }) : null
  vpc_security_group_ids      = var.network_interface == null ? local.vpc_security_group_ids : null

  timeouts {
    create = try(var.timeouts.create, null)
    update = try(var.timeouts.update, null)
    delete = try(var.timeouts.delete, null)
  }
}

################################################################################
# Instance - Ignore AMI Changes
################################################################################

resource "aws_instance" "ignore_ami" {
  count = local.create && var.ignore_ami_changes && !var.create_spot_instance ? 1 : 0

  region = var.region

  ami                         = local.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification != null ? [var.capacity_reservation_specification] : []

    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference

      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? [capacity_reservation_specification.value.capacity_reservation_target] : []

        content {
          capacity_reservation_id                 = capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_target.value.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options != null ? [var.cpu_options] : []

    content {
      amd_sev_snp      = cpu_options.value.amd_sev_snp
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  credit_specification {
    cpu_credits = local.is_t_instance_type ? var.cpu_credits : null
  }

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  # `ebs_block_device` managed by separate resource

  ebs_optimized = var.ebs_optimized

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  enable_primary_ipv6 = var.enable_primary_ipv6

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device != null ? var.ephemeral_block_device : {}

    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  host_resource_group_arn              = var.host_resource_group_arn
  iam_instance_profile                 = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  dynamic "instance_market_options" {
    for_each = var.instance_market_options != null ? [var.instance_market_options] : []

    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = instance_market_options.value.spot_options != null ? [instance_market_options.value.spot_options] : []

        content {
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior
          max_price                      = spot_options.value.max_price
          spot_instance_type             = spot_options.value.spot_instance_type
          valid_until                    = spot_options.value.valid_until
        }
      }
    }
  }

  instance_type      = var.instance_type
  ipv6_address_count = var.ipv6_address_count
  ipv6_addresses     = var.ipv6_addresses
  key_name           = var.key_name

  dynamic "launch_template" {
    for_each = var.launch_template != null ? [var.launch_template] : []

    content {
      id      = launch_template.value.id
      name    = launch_template.value.name
      version = launch_template.value.version
    }
  }

  dynamic "maintenance_options" {
    for_each = var.maintenance_options != null ? [var.maintenance_options] : []

    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []

    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags
    }
  }

  monitoring = var.monitoring

  dynamic "network_interface" {
    for_each = var.network_interface != null ? var.network_interface : {}

    content {
      delete_on_termination = network_interface.value.delete_on_termination
      device_index          = coalesce(network_interface.value.device_index, network_interface.key)
      network_card_index    = network_interface.value.network_card_index
      network_interface_id  = network_interface.value.network_interface_id

    }
  }

  placement_group            = var.placement_group
  placement_partition_number = var.placement_partition_number

  dynamic "private_dns_name_options" {
    for_each = var.private_dns_name_options != null ? [var.private_dns_name_options] : []

    content {
      enable_resource_name_dns_aaaa_record = private_dns_name_options.value.enable_resource_name_dns_aaaa_record
      enable_resource_name_dns_a_record    = private_dns_name_options.value.enable_resource_name_dns_a_record
      hostname_type                        = private_dns_name_options.value.hostname_type
    }
  }

  private_ip = var.private_ip

  dynamic "root_block_device" {
    for_each = var.root_block_device != null ? [var.root_block_device] : []

    content {
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted             = root_block_device.value.encrypted
      iops                  = root_block_device.value.iops
      kms_key_id            = root_block_device.value.kms_key_id
      tags                  = root_block_device.value.tags
      throughput            = root_block_device.value.throughput
      volume_size           = root_block_device.value.size
      volume_type           = root_block_device.value.type
    }
  }

  secondary_private_ips       = var.secondary_private_ips
  source_dest_check           = var.network_interface != null ? null : var.source_dest_check
  subnet_id                   = var.subnet_id
  tags                        = local.instance_tags
  tenancy                     = var.tenancy
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change
  volume_tags                 = var.enable_volume_tags ? merge(var.tags, var.volume_tags, { "Name" = var.name }) : null
  vpc_security_group_ids      = var.network_interface == null ? local.vpc_security_group_ids : null

  timeouts {
    create = try(var.timeouts.create, null)
    update = try(var.timeouts.update, null)
    delete = try(var.timeouts.delete, null)
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

################################################################################
# Spot Instance
################################################################################

resource "aws_spot_instance_request" "this" {
  count = local.create && var.create_spot_instance ? 1 : 0

  region = var.region

  # Spot request specific attributes
  instance_interruption_behavior = var.spot_instance_interruption_behavior
  launch_group                   = var.spot_launch_group
  spot_price                     = var.spot_price
  spot_type                      = var.spot_type
  wait_for_fulfillment           = var.spot_wait_for_fulfillment
  valid_from                     = var.spot_valid_from
  valid_until                    = var.spot_valid_until
  # End spot request specific attributes

  ami                         = local.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification != null ? [var.capacity_reservation_specification] : []

    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference

      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? [capacity_reservation_specification.value.capacity_reservation_target] : []

        content {
          capacity_reservation_id                 = capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_target.value.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options != null ? [var.cpu_options] : []

    content {
      amd_sev_snp      = cpu_options.value.amd_sev_snp
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  credit_specification {
    cpu_credits = local.is_t_instance_type ? var.cpu_credits : null
  }

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  # `ebs_block_device` managed by separate resource

  ebs_optimized = var.ebs_optimized

  enclave_options {
    enabled = var.enclave_options_enabled
  }

  enable_primary_ipv6 = var.enable_primary_ipv6

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device != null ? var.ephemeral_block_device : {}

    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  host_resource_group_arn              = var.host_resource_group_arn
  iam_instance_profile                 = var.create_iam_instance_profile ? aws_iam_instance_profile.this[0].name : var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  instance_type      = var.instance_type
  ipv6_address_count = var.ipv6_address_count
  ipv6_addresses     = var.ipv6_addresses
  key_name           = var.key_name

  dynamic "launch_template" {
    for_each = var.launch_template != null ? [var.launch_template] : []

    content {
      id      = launch_template.value.id
      name    = launch_template.value.name
      version = launch_template.value.version
    }
  }

  dynamic "maintenance_options" {
    for_each = var.maintenance_options != null ? [var.maintenance_options] : []

    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []

    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags
    }
  }

  monitoring = var.monitoring

  dynamic "network_interface" {
    for_each = var.network_interface != null ? var.network_interface : {}

    content {
      delete_on_termination = network_interface.value.delete_on_termination
      device_index          = try(network_interface.value.device_index, network_interface.key)
      network_card_index    = network_interface.value.network_card_index
      network_interface_id  = network_interface.value.network_interface_id

    }
  }

  placement_group            = var.placement_group
  placement_partition_number = var.placement_partition_number

  dynamic "private_dns_name_options" {
    for_each = var.private_dns_name_options != null ? [var.private_dns_name_options] : []

    content {
      enable_resource_name_dns_aaaa_record = private_dns_name_options.value.enable_resource_name_dns_aaaa_record
      enable_resource_name_dns_a_record    = private_dns_name_options.value.enable_resource_name_dns_a_record
      hostname_type                        = private_dns_name_options.value.hostname_type
    }
  }

  private_ip = var.private_ip

  dynamic "root_block_device" {
    for_each = var.root_block_device != null ? [var.root_block_device] : []

    content {
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted             = root_block_device.value.encrypted
      iops                  = root_block_device.value.iops
      kms_key_id            = root_block_device.value.kms_key_id
      tags                  = root_block_device.value.tags
      throughput            = root_block_device.value.throughput
      volume_size           = root_block_device.value.size
      volume_type           = root_block_device.value.type
    }
  }

  secondary_private_ips       = var.secondary_private_ips
  source_dest_check           = var.network_interface != null ? null : var.source_dest_check
  subnet_id                   = var.subnet_id
  tags                        = local.instance_tags
  tenancy                     = var.tenancy
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change
  volume_tags                 = var.enable_volume_tags ? merge(var.tags, var.volume_tags, { "Name" = var.name }) : null
  vpc_security_group_ids      = var.network_interface == null ? local.vpc_security_group_ids : null

  timeouts {
    create = try(var.timeouts.create, null)
    delete = try(var.timeouts.delete, null)
  }

  lifecycle {
    ignore_changes = [
      ebs_block_device,
    ]
  }
}

resource "aws_ec2_tag" "spot_instance" {
  for_each = { for k, v in local.instance_tags : k => v if local.create && var.create_spot_instance }

  resource_id = aws_spot_instance_request.this[0].spot_instance_id
  key         = each.key
  value       = each.value
}

################################################################################
# EBS Volume(s)
################################################################################

resource "aws_ebs_volume" "this" {
  for_each = var.create && var.ebs_volumes != null ? var.ebs_volumes : {}

  region = var.region

  availability_zone    = local.instance_availability_zone
  encrypted            = each.value.encrypted
  final_snapshot       = each.value.final_snapshot
  iops                 = each.value.iops
  kms_key_id           = each.value.kms_key_id
  multi_attach_enabled = each.value.multi_attach_enabled
  outpost_arn          = each.value.outpost_arn
  size                 = each.value.size
  snapshot_id          = each.value.snapshot_id

  tags = merge(
    var.tags,
    var.volume_tags,
    { "Name" = "${var.name}-${each.key}" },
    each.value.tags,
  )

  throughput = each.value.throughput
  type       = each.value.type
}

resource "aws_volume_attachment" "this" {
  for_each = var.create && var.ebs_volumes != null ? var.ebs_volumes : {}

  region = var.region

  device_name                    = coalesce(each.value.device_name, each.key)
  instance_id                    = local.instance_id
  volume_id                      = aws_ebs_volume.this[each.key].id
  force_detach                   = each.value.force_detach
  skip_destroy                   = each.value.skip_destroy
  stop_instance_before_detaching = each.value.stop_instance_before_detaching
}

################################################################################
# IAM Role / Instance Profile
################################################################################

locals {
  iam_role_name = try(coalesce(var.iam_role_name, var.name), "")
}

data "aws_iam_policy_document" "assume_role_policy" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  statement {
    sid     = "EC2AssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.${data.aws_partition.current.dns_suffix}"]
    }
  }
}

resource "aws_iam_role" "this" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  name        = var.iam_role_use_name_prefix ? null : local.iam_role_name
  name_prefix = var.iam_role_use_name_prefix ? "${local.iam_role_name}-" : null
  path        = var.iam_role_path
  description = var.iam_role_description

  assume_role_policy    = data.aws_iam_policy_document.assume_role_policy[0].json
  permissions_boundary  = var.iam_role_permissions_boundary
  force_detach_policies = true

  tags = merge(var.tags, var.iam_role_tags)
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for k, v in var.iam_role_policies : k => v if var.create && var.create_iam_instance_profile }

  policy_arn = each.value
  role       = aws_iam_role.this[0].name
}

resource "aws_iam_instance_profile" "this" {
  count = var.create && var.create_iam_instance_profile ? 1 : 0

  role = aws_iam_role.this[0].name

  name        = var.iam_role_use_name_prefix ? null : local.iam_role_name
  name_prefix = var.iam_role_use_name_prefix ? "${local.iam_role_name}-" : null
  path        = var.iam_role_path

  tags = merge(var.tags, var.iam_role_tags)

  lifecycle {
    create_before_destroy = true
  }
}

################################################################################
# Security Group
################################################################################

locals {
  create_security_group = var.create && var.create_security_group && var.network_interface == null
  security_group_name   = try(coalesce(var.security_group_name, var.name), "")

  vpc_security_group_ids = local.create_security_group ? concat(var.vpc_security_group_ids, [aws_security_group.this[0].id]) : var.vpc_security_group_ids
}

data "aws_subnet" "this" {
  count = local.create_security_group ? 1 : 0

  region = var.region

  id = var.subnet_id
}

resource "aws_security_group" "this" {
  count = local.create_security_group ? 1 : 0

  region = var.region

  name        = var.security_group_use_name_prefix ? null : local.security_group_name
  name_prefix = var.security_group_use_name_prefix ? "${local.security_group_name}-" : null
  description = var.security_group_description
  vpc_id      = coalesce(var.security_group_vpc_id, data.aws_subnet.this[0].vpc_id)

  tags = merge(
    var.tags,
    { "Name" = local.security_group_name },
    var.security_group_tags
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = local.create_security_group && var.security_group_egress_rules != null ? var.security_group_egress_rules : {}

  region = var.region

  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  description                  = each.value.description
  from_port                    = try(coalesce(each.value.from_port, each.value.to_port), null)
  ip_protocol                  = each.value.ip_protocol
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  security_group_id            = aws_security_group.this[0].id

  tags = merge(
    var.tags,
    var.security_group_tags,
    { "Name" = "${var.name}-${each.key}" },
    each.value.tags,
  )

  to_port = try(coalesce(each.value.to_port, each.value.from_port), null)
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = local.create_security_group && var.security_group_ingress_rules != null ? var.security_group_ingress_rules : {}

  region = var.region

  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  description                  = each.value.description
  from_port                    = try(coalesce(each.value.from_port, each.value.to_port), null)
  ip_protocol                  = each.value.ip_protocol
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  security_group_id            = aws_security_group.this[0].id

  tags = merge(
    var.tags,
    var.security_group_tags,
    { "Name" = "${var.name}-${each.key}" },
    each.value.tags,
  )

  to_port = try(coalesce(each.value.to_port, each.value.from_port), null)
}

################################################################################
# Elastic IP
################################################################################

resource "aws_eip" "this" {
  count = local.create && var.create_eip && !var.create_spot_instance ? 1 : 0

  region = var.region

  domain   = var.eip_domain
  instance = local.instance_id

  tags = merge(var.tags, var.eip_tags)
}
