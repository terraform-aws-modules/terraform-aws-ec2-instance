# ==============================================================================
# STANDARDIZED EC2 INSTANCE EXAMPLE - COMPLETE CONFIGURATION
# ==============================================================================
# This example follows strict standards for LLM code generation:
# 1. NO terraform/provider blocks (handled by Terragrunt)
# 2. Standardized module name "ec2_instance" for consistent output references
# 3. All variables use var. prefix
# 4. Import blocks for existing resources
# 5. Consistent structure and naming patterns
# ==============================================================================

# ==============================================================================
# IMPORT EXISTING RESOURCES (when importing)
# ==============================================================================

# Import existing EC2 instance
import {
  to = module.ec2_instance.aws_instance.this[0]
  id = var.instance_id  # Provided during import operation
}

# Import existing security group (if not creating new one)
import {
  to = module.ec2_instance.aws_security_group.this[0]
  id = var.existing_security_group_id
}

# Import existing IAM role (if not creating new one)
import {
  to = module.ec2_instance.aws_iam_role.this[0]
  id = var.existing_iam_role_name
}

# ==============================================================================
# MAIN MODULE CONFIGURATION
# ==============================================================================
# CRITICAL: Module name MUST be "ec2_instance" for consistent output references
# This ensures outputs.tf can reliably reference module.ec2_instance.*

module "ec2_instance" {
  source = var.module_source

  # ==============================================================================
  # BASIC CONFIGURATION
  # ==============================================================================
  
  create = var.create
  name   = var.name
  region = var.region

  # ==============================================================================
  # AMI AND INSTANCE CONFIGURATION
  # ==============================================================================
  
  ami                    = var.ami
  ami_ssm_parameter      = var.ami_ssm_parameter
  ignore_ami_changes     = var.ignore_ami_changes
  instance_type          = var.instance_type

  # ==============================================================================
  # NETWORK CONFIGURATION
  # ==============================================================================
  
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  private_ip                  = var.private_ip
  secondary_private_ips       = var.secondary_private_ips
  ipv6_address_count          = var.ipv6_address_count
  ipv6_addresses              = var.ipv6_addresses
  enable_primary_ipv6         = var.enable_primary_ipv6
  source_dest_check           = var.source_dest_check

  # ==============================================================================
  # STORAGE CONFIGURATION
  # ==============================================================================
  
  ebs_optimized         = var.ebs_optimized
  root_block_device     = var.root_block_device
  ebs_volumes           = var.ebs_volumes
  ephemeral_block_device = var.ephemeral_block_device

  # ==============================================================================
  # SECURITY AND ACCESS CONFIGURATION
  # ==============================================================================
  
  key_name                = var.key_name
  get_password_data       = var.get_password_data
  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = var.disable_api_termination
  disable_api_stop        = var.disable_api_stop

  # ==============================================================================
  # METADATA AND MONITORING CONFIGURATION
  # ==============================================================================
  
  metadata_options        = var.metadata_options
  monitoring              = var.monitoring
  enclave_options_enabled = var.enclave_options_enabled

  # ==============================================================================
  # ADVANCED CONFIGURATION
  # ==============================================================================
  
  cpu_options                           = var.cpu_options
  cpu_credits                           = var.cpu_credits
  capacity_reservation_specification    = var.capacity_reservation_specification
  hibernation                           = var.hibernation
  host_id                               = var.host_id
  host_resource_group_arn               = var.host_resource_group_arn
  tenancy                               = var.tenancy
  placement_group                       = var.placement_group
  placement_partition_number            = var.placement_partition_number

  # ==============================================================================
  # LIFECYCLE AND MAINTENANCE
  # ==============================================================================
  
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  maintenance_options                  = var.maintenance_options
  private_dns_name_options             = var.private_dns_name_options

  # ==============================================================================
  # USER DATA AND INITIALIZATION
  # ==============================================================================
  
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change

  # ==============================================================================
  # SPOT INSTANCE CONFIGURATION
  # ==============================================================================
  
  create_spot_instance                = var.create_spot_instance
  spot_price                          = var.spot_price
  spot_wait_for_fulfillment           = var.spot_wait_for_fulfillment
  spot_type                           = var.spot_type
  spot_instance_interruption_behavior = var.spot_instance_interruption_behavior
  spot_launch_group                   = var.spot_launch_group
  spot_valid_from                     = var.spot_valid_from
  spot_valid_until                    = var.spot_valid_until

  # ==============================================================================
  # NETWORK INTERFACE CONFIGURATION
  # ==============================================================================
  
  network_interface = var.network_interface

  # ==============================================================================
  # LAUNCH TEMPLATE CONFIGURATION
  # ==============================================================================
  
  launch_template         = var.launch_template
  instance_market_options = var.instance_market_options

  # ==============================================================================
  # TAGGING CONFIGURATION
  # ==============================================================================
  
  tags                = var.tags
  instance_tags       = var.instance_tags
  volume_tags         = var.volume_tags
  enable_volume_tags  = var.enable_volume_tags

  # ==============================================================================
  # TIMEOUT CONFIGURATION
  # ==============================================================================
  
  timeouts = var.timeouts

  # ==============================================================================
  # IAM ROLE AND INSTANCE PROFILE CONFIGURATION
  # ==============================================================================
  
  create_iam_instance_profile   = var.create_iam_instance_profile
  iam_role_name                 = var.iam_role_name
  iam_role_use_name_prefix      = var.iam_role_use_name_prefix
  iam_role_path                 = var.iam_role_path
  iam_role_description          = var.iam_role_description
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_policies             = var.iam_role_policies
  iam_role_tags                 = var.iam_role_tags

  # ==============================================================================
  # SECURITY GROUP CONFIGURATION
  # ==============================================================================
  
  create_security_group           = var.create_security_group
  security_group_name             = var.security_group_name
  security_group_use_name_prefix  = var.security_group_use_name_prefix
  security_group_description      = var.security_group_description
  security_group_vpc_id           = var.security_group_vpc_id
  security_group_tags             = var.security_group_tags
  security_group_egress_rules     = var.security_group_egress_rules
  security_group_ingress_rules    = var.security_group_ingress_rules

  # ==============================================================================
  # ELASTIC IP CONFIGURATION
  # ==============================================================================
  
  create_eip = var.create_eip
  eip_domain = var.eip_domain
  eip_tags   = var.eip_tags

  # ==============================================================================
  # LEGACY/COMPATIBILITY VARIABLES
  # ==============================================================================
  
  putin_khuylo = var.putin_khuylo
}