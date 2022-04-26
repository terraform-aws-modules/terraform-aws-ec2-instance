module "wrapper" {
  source = "../"

  for_each = var.items

  create                               = try(each.value.create, var.default.create, true)
  name                                 = try(each.value.name, var.default.name, "")
  ami                                  = try(each.value.ami, var.default.ami, "")
  associate_public_ip_address          = try(each.value.associate_public_ip_address, var.default.associate_public_ip_address, null)
  availability_zone                    = try(each.value.availability_zone, var.default.availability_zone, null)
  capacity_reservation_specification   = try(each.value.capacity_reservation_specification, var.default.capacity_reservation_specification, null)
  cpu_credits                          = try(each.value.cpu_credits, var.default.cpu_credits, null)
  disable_api_termination              = try(each.value.disable_api_termination, var.default.disable_api_termination, null)
  ebs_block_device                     = try(each.value.ebs_block_device, var.default.ebs_block_device, [])
  ebs_optimized                        = try(each.value.ebs_optimized, var.default.ebs_optimized, null)
  enclave_options_enabled              = try(each.value.enclave_options_enabled, var.default.enclave_options_enabled, null)
  ephemeral_block_device               = try(each.value.ephemeral_block_device, var.default.ephemeral_block_device, [])
  get_password_data                    = try(each.value.get_password_data, var.default.get_password_data, null)
  hibernation                          = try(each.value.hibernation, var.default.hibernation, null)
  host_id                              = try(each.value.host_id, var.default.host_id, null)
  iam_instance_profile                 = try(each.value.iam_instance_profile, var.default.iam_instance_profile, null)
  instance_initiated_shutdown_behavior = try(each.value.instance_initiated_shutdown_behavior, var.default.instance_initiated_shutdown_behavior, null)
  instance_type                        = try(each.value.instance_type, var.default.instance_type, "t3.micro")
  ipv6_address_count                   = try(each.value.ipv6_address_count, var.default.ipv6_address_count, null)
  ipv6_addresses                       = try(each.value.ipv6_addresses, var.default.ipv6_addresses, null)
  key_name                             = try(each.value.key_name, var.default.key_name, null)
  launch_template                      = try(each.value.launch_template, var.default.launch_template, null)
  metadata_options                     = try(each.value.metadata_options, var.default.metadata_options, {})
  monitoring                           = try(each.value.monitoring, var.default.monitoring, false)
  network_interface                    = try(each.value.network_interface, var.default.network_interface, [])
  placement_group                      = try(each.value.placement_group, var.default.placement_group, null)
  private_ip                           = try(each.value.private_ip, var.default.private_ip, null)
  root_block_device                    = try(each.value.root_block_device, var.default.root_block_device, [])
  secondary_private_ips                = try(each.value.secondary_private_ips, var.default.secondary_private_ips, null)
  source_dest_check                    = try(each.value.source_dest_check, var.default.source_dest_check, true)
  subnet_id                            = try(each.value.subnet_id, var.default.subnet_id, null)
  tags                                 = try(each.value.tags, var.default.tags, {})
  tenancy                              = try(each.value.tenancy, var.default.tenancy, null)
  user_data                            = try(each.value.user_data, var.default.user_data, null)
  user_data_base64                     = try(each.value.user_data_base64, var.default.user_data_base64, null)
  volume_tags                          = try(each.value.volume_tags, var.default.volume_tags, {})
  enable_volume_tags                   = try(each.value.enable_volume_tags, var.default.enable_volume_tags, true)
  vpc_security_group_ids               = try(each.value.vpc_security_group_ids, var.default.vpc_security_group_ids, null)
  timeouts                             = try(each.value.timeouts, var.default.timeouts, {})
  cpu_core_count                       = try(each.value.cpu_core_count, var.default.cpu_core_count, null)
  cpu_threads_per_core                 = try(each.value.cpu_threads_per_core, var.default.cpu_threads_per_core, null)
  create_spot_instance                 = try(each.value.create_spot_instance, var.default.create_spot_instance, false)
  spot_price                           = try(each.value.spot_price, var.default.spot_price, null)
  spot_wait_for_fulfillment            = try(each.value.spot_wait_for_fulfillment, var.default.spot_wait_for_fulfillment, null)
  spot_type                            = try(each.value.spot_type, var.default.spot_type, null)
  spot_launch_group                    = try(each.value.spot_launch_group, var.default.spot_launch_group, null)
  spot_block_duration_minutes          = try(each.value.spot_block_duration_minutes, var.default.spot_block_duration_minutes, null)
  spot_instance_interruption_behavior  = try(each.value.spot_instance_interruption_behavior, var.default.spot_instance_interruption_behavior, null)
  spot_valid_until                     = try(each.value.spot_valid_until, var.default.spot_valid_until, null)
  spot_valid_from                      = try(each.value.spot_valid_from, var.default.spot_valid_from, null)
  putin_khuylo                         = try(each.value.putin_khuylo, var.default.putin_khuylo, true)
}