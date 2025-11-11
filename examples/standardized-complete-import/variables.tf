# ==============================================================================
# STANDARDIZED VARIABLE DEFINITIONS FOR EC2 INSTANCE MODULE
# ==============================================================================
# This file follows strict standards for LLM code generation:
# 1. All variables include comprehensive documentation
# 2. Proper type definitions and validation rules
# 3. Import-specific variables for existing resources
# 4. Consistent naming and structure
# 5. Real-world examples and use cases
# ==============================================================================

# ==============================================================================
# MODULE SOURCE CONFIGURATION
# ==============================================================================

variable "module_source" {
  description = "Source path for the EC2 instance module. Must be specified for consistent module referencing."
  type        = string
  default     = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.6.0"
  
  validation {
    condition     = length(var.module_source) > 0
    error_message = "Module source cannot be empty."
  }
}

# ==============================================================================
# IMPORT-SPECIFIC VARIABLES
# ==============================================================================
# These variables are used when importing existing AWS resources

variable "instance_id" {
  description = "The ID of the existing EC2 instance to import. Required when importing existing instances."
  type        = string
  default     = null
  
  validation {
    condition = var.instance_id == null || can(regex("^i-[0-9a-f]{8,17}$", var.instance_id))
    error_message = "Instance ID must be in the format i-xxxxxxxx or i-xxxxxxxxxxxxxxxxx."
  }
}

variable "existing_security_group_id" {
  description = "The ID of the existing security group to import. Used when importing existing security groups."
  type        = string
  default     = null
  
  validation {
    condition = var.existing_security_group_id == null || can(regex("^sg-[0-9a-f]{8,17}$", var.existing_security_group_id))
    error_message = "Security group ID must be in the format sg-xxxxxxxx or sg-xxxxxxxxxxxxxxxxx."
  }
}

variable "existing_iam_role_name" {
  description = "The name of the existing IAM role to import. Used when importing existing IAM roles."
  type        = string
  default     = null
  
  validation {
    condition = var.existing_iam_role_name == null || can(regex("^[a-zA-Z0-9+=,.@_-]+$", var.existing_iam_role_name))
    error_message = "IAM role name must contain only alphanumeric characters and +=,.@_- characters."
  }
}

# ==============================================================================
# BASIC CONFIGURATION
# ==============================================================================

variable "create" {
  description = "Whether to create an EC2 instance. Set to false to skip instance creation entirely."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on EC2 instance created. This will be used for the Name tag and resource naming."
  type        = string
  
  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 255
    error_message = "Name must be between 1 and 255 characters."
  }
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9-_]*$", var.name))
    error_message = "Name must contain only alphanumeric characters, hyphens, and underscores."
  }
}

variable "region" {
  description = "AWS region where the EC2 instance will be created. If null, uses provider default region."
  type        = string
  default     = null
  
  validation {
    condition = var.region == null || can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.region))
    error_message = "Region must be a valid AWS region format (e.g., us-east-1, eu-west-1)."
  }
}

# ==============================================================================
# AMI AND INSTANCE TYPE CONFIGURATION
# ==============================================================================

variable "ami" {
  description = "ID of AMI to use for the instance. If null, will use ami_ssm_parameter to fetch latest AMI."
  type        = string
  default     = null
  
  validation {
    condition = var.ami == null || can(regex("^ami-[0-9a-f]{8,17}$", var.ami))
    error_message = "AMI ID must be in the format ami-xxxxxxxx or ami-xxxxxxxxxxxxxxxxx."
  }
}

variable "ami_ssm_parameter" {
  description = "SSM parameter name for the AMI ID. Used when ami is null to fetch the latest AMI automatically."
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  
  validation {
    condition     = can(regex("^/", var.ami_ssm_parameter))
    error_message = "SSM parameter must start with a forward slash (/)."
  }
}

variable "ignore_ami_changes" {
  description = "Whether changes to the AMI ID should be ignored by Terraform. Useful for preventing instance replacement when AMI updates."
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "The type of instance to start. Choose based on your performance and cost requirements."
  type        = string
  default     = "t3.micro"
  
  validation {
    condition = can(regex("^[a-z][0-9][a-z]*\\.[a-z0-9]+$", var.instance_type))
    error_message = "Instance type must be a valid EC2 instance type (e.g., t3.micro, m5.large, c5.xlarge)."
  }
}

# ==============================================================================
# NETWORK CONFIGURATION
# ==============================================================================

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC. Required for internet access in public subnets."
  type        = bool
  default     = null
}

variable "availability_zone" {
  description = "AZ to start the instance in. If not specified, AWS will choose automatically within the region."
  type        = string
  default     = null
  
  validation {
    condition = var.availability_zone == null || can(regex("^[a-z]{2}-[a-z]+-[0-9][a-z]$", var.availability_zone))
    error_message = "Availability zone must be in the format region+letter (e.g., us-east-1a, eu-west-1b)."
  }
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch the instance in. Must be in the same AZ as availability_zone if specified."
  type        = string
  default     = null
  
  validation {
    condition = var.subnet_id == null || can(regex("^subnet-[0-9a-f]{8,17}$", var.subnet_id))
    error_message = "Subnet ID must be in the format subnet-xxxxxxxx or subnet-xxxxxxxxxxxxxxxxx."
  }
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with the instance. Controls network access rules."
  type        = list(string)
  default     = []
  
  validation {
    condition = alltrue([
      for sg in var.vpc_security_group_ids : can(regex("^sg-[0-9a-f]{8,17}$", sg))
    ])
    error_message = "All security group IDs must be in the format sg-xxxxxxxx or sg-xxxxxxxxxxxxxxxxx."
  }
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC. Must be within the subnet CIDR range."
  type        = string
  default     = null
}

variable "secondary_private_ips" {
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface."
  type        = list(string)
  default     = null
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface."
  type        = number
  default     = null
  
  validation {
    condition = var.ipv6_address_count == null || (var.ipv6_address_count >= 0 && var.ipv6_address_count <= 16)
    error_message = "IPv6 address count must be between 0 and 16."
  }
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface."
  type        = list(string)
  default     = null
}

variable "enable_primary_ipv6" {
  description = "Whether to assign a primary IPv6 Global Unicast Address (GUA) to the instance when launched in a dual-stack or IPv6-only subnet."
  type        = bool
  default     = null
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  type        = bool
  default     = null
}

# ==============================================================================
# STORAGE CONFIGURATION
# ==============================================================================

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized. Improves EBS performance for supported instance types."
  type        = bool
  default     = null
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. Controls OS disk configuration."
  type = object({
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, true)
    iops                  = optional(number)
    kms_key_id            = optional(string)
    tags                  = optional(map(string), {})
    throughput            = optional(number)
    size                  = optional(number, 20)
    type                  = optional(string, "gp3")
  })
  default = null
}

variable "ebs_volumes" {
  description = "Additional EBS volumes to attach to the instance. Map key will be used as device name if device_name not specified."
  type = map(object({
    encrypted            = optional(bool, true)
    final_snapshot       = optional(bool, false)
    iops                 = optional(number)
    kms_key_id           = optional(string)
    multi_attach_enabled = optional(bool, false)
    outpost_arn          = optional(string)
    size                 = optional(number, 10)
    snapshot_id          = optional(string)
    tags                 = optional(map(string), {})
    throughput           = optional(number)
    type                 = optional(string, "gp3")
    device_name                    = optional(string)
    force_detach                   = optional(bool, false)
    skip_destroy                   = optional(bool, false)
    stop_instance_before_detaching = optional(bool, false)
  }))
  default = null
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance. Temporary storage that's lost on stop/terminate."
  type = map(object({
    device_name  = string
    no_device    = optional(bool)
    virtual_name = optional(string)
  }))
  default = null
}

# ==============================================================================
# SECURITY AND ACCESS CONFIGURATION
# ==============================================================================

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance. Required for SSH access to Linux instances."
  type        = string
  default     = null
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it. Useful for Windows instances."
  type        = bool
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Provides AWS API access to the instance."
  type        = string
  default     = null
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection. Prevents accidental termination via API."
  type        = bool
  default     = null
}

variable "disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection. Prevents accidental stopping via API."
  type        = bool
  default     = null
}

# ==============================================================================
# METADATA AND MONITORING CONFIGURATION
# ==============================================================================

variable "metadata_options" {
  description = "Customize the metadata options of the instance. Controls access to instance metadata service."
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_protocol_ipv6          = optional(string, "disabled")
    http_put_response_hop_limit = optional(number, 1)
    http_tokens                 = optional(string, "required")
    instance_metadata_tags      = optional(string, "disabled")
  })
  default = {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled. Provides 1-minute CloudWatch metrics."
  type        = bool
  default     = null
}

variable "enclave_options_enabled" {
  description = "Whether Nitro Enclaves will be enabled on the instance. Provides isolated compute environments."
  type        = bool
  default     = null
}

# ==============================================================================
# ADVANCED CONFIGURATION
# ==============================================================================

variable "cpu_options" {
  description = "Defines CPU options to apply to the instance at launch time. Useful for licensing optimization."
  type = object({
    amd_sev_snp      = optional(string)
    core_count       = optional(number)
    threads_per_core = optional(number)
  })
  default = null
}

variable "cpu_credits" {
  description = "The credit option for CPU usage (unlimited or standard). Only applicable to burstable performance instances (T2/T3/T4g)."
  type        = string
  default     = null
  
  validation {
    condition = var.cpu_credits == null || contains(["standard", "unlimited"], var.cpu_credits)
    error_message = "CPU credits must be 'standard' or 'unlimited'."
  }
}

variable "capacity_reservation_specification" {
  description = "Describes an instance's Capacity Reservation targeting option. Ensures capacity availability."
  type = object({
    capacity_reservation_preference = optional(string)
    capacity_reservation_target = optional(object({
      capacity_reservation_id                 = optional(string)
      capacity_reservation_resource_group_arn = optional(string)
    }))
  })
  default = null
}

variable "hibernation" {
  description = "If true, the launched EC2 instance will support hibernation. Saves instance state to EBS."
  type        = bool
  default     = null
}

variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host."
  type        = string
  default     = null
}

variable "host_resource_group_arn" {
  description = "ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host."
  type        = string
  default     = null
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  type        = string
  default     = null
  
  validation {
    condition = var.tenancy == null || contains(["default", "dedicated", "host"], var.tenancy)
    error_message = "Tenancy must be 'default', 'dedicated', or 'host'."
  }
}

variable "placement_group" {
  description = "The Placement Group to start the instance in. Provides low latency networking between instances."
  type        = string
  default     = null
}

variable "placement_partition_number" {
  description = "Number of the partition the instance is in. Valid only if the aws_placement_group resource's strategy argument is set to partition."
  type        = number
  default     = null
  
  validation {
    condition = var.placement_partition_number == null || (var.placement_partition_number >= 1 && var.placement_partition_number <= 7)
    error_message = "Placement partition number must be between 1 and 7."
  }
}

# ==============================================================================
# LIFECYCLE AND MAINTENANCE
# ==============================================================================

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances."
  type        = string
  default     = null
  
  validation {
    condition = var.instance_initiated_shutdown_behavior == null || contains(["stop", "terminate"], var.instance_initiated_shutdown_behavior)
    error_message = "Instance initiated shutdown behavior must be 'stop' or 'terminate'."
  }
}

variable "maintenance_options" {
  description = "The maintenance options for the instance. Controls automatic recovery behavior."
  type = object({
    auto_recovery = optional(string, "default")
  })
  default = null
}

variable "private_dns_name_options" {
  description = "Customize the private DNS name options of the instance. Controls DNS resolution behavior."
  type = object({
    enable_resource_name_dns_a_record    = optional(bool)
    enable_resource_name_dns_aaaa_record = optional(bool)
    hostname_type                        = optional(string)
  })
  default = null
}

# ==============================================================================
# USER DATA AND INITIALIZATION
# ==============================================================================

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this for gzip-compressed data."
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  type        = bool
  default     = null
}

# ==============================================================================
# SPOT INSTANCE CONFIGURATION
# ==============================================================================

variable "create_spot_instance" {
  description = "Depicts if the instance is a spot instance. Spot instances can save up to 90% of On-Demand costs."
  type        = bool
  default     = false
}

variable "spot_price" {
  description = "The maximum price to request on the spot market. Defaults to on-demand price if not specified."
  type        = string
  default     = null
}

variable "spot_wait_for_fulfillment" {
  description = "If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached."
  type        = bool
  default     = null
}

variable "spot_type" {
  description = "If set to one-time, after the instance is terminated, the spot request will be closed. Default persistent."
  type        = string
  default     = null
  
  validation {
    condition = var.spot_type == null || contains(["one-time", "persistent"], var.spot_type)
    error_message = "Spot type must be 'one-time' or 'persistent'."
  }
}

variable "spot_instance_interruption_behavior" {
  description = "Indicates Spot instance behavior when it is interrupted. Valid values are terminate, stop, or hibernate."
  type        = string
  default     = null
  
  validation {
    condition = var.spot_instance_interruption_behavior == null || contains(["terminate", "stop", "hibernate"], var.spot_instance_interruption_behavior)
    error_message = "Spot interruption behavior must be 'terminate', 'stop', or 'hibernate'."
  }
}

variable "spot_launch_group" {
  description = "A launch group is a group of spot instances that launch together and terminate together. If left empty instances are launched and terminated individually."
  type        = string
  default     = null
}

variable "spot_valid_from" {
  description = "The start date and time of the request, in UTC RFC3339 format (for example, YYYY-MM-DDTHH:MM:SSZ)."
  type        = string
  default     = null
}

variable "spot_valid_until" {
  description = "The end date and time of the request, in UTC RFC3339 format (for example, YYYY-MM-DDTHH:MM:SSZ)."
  type        = string
  default     = null
}

# ==============================================================================
# NETWORK INTERFACE CONFIGURATION
# ==============================================================================

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time. For advanced networking scenarios."
  type = map(object({
    delete_on_termination = optional(bool, true)
    device_index          = optional(number)
    network_card_index    = optional(number, 0)
    network_interface_id  = string
  }))
  default = null
}

# ==============================================================================
# LAUNCH TEMPLATE CONFIGURATION
# ==============================================================================

variable "launch_template" {
  description = "Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template."
  type = object({
    id      = optional(string)
    name    = optional(string)
    version = optional(string)
  })
  default = null
}

variable "instance_market_options" {
  description = "The market (purchasing) option for the instance. If set, overrides the create_spot_instance variable."
  type = object({
    market_type = optional(string, "spot")
    spot_options = optional(object({
      instance_interruption_behavior = optional(string, "terminate")
      max_price                      = optional(string)
      spot_instance_type             = optional(string, "one-time")
      valid_until                    = optional(string)
    }))
  })
  default = null
}

# ==============================================================================
# TAGGING CONFIGURATION
# ==============================================================================

variable "tags" {
  description = "A mapping of tags to assign to the resource. These tags will be applied to the EC2 instance."
  type        = map(string)
  default     = {}
}

variable "instance_tags" {
  description = "Additional tags for the instance. These will be merged with the tags variable."
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = {}
}

variable "enable_volume_tags" {
  description = "Whether to enable volume tags (if enabled it conflicts with root_block_device tags)."
  type        = bool
  default     = true
}

# ==============================================================================
# TIMEOUT CONFIGURATION
# ==============================================================================

variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources."
  type        = map(string)
  default     = {}
}

# ==============================================================================
# IAM ROLE AND INSTANCE PROFILE CONFIGURATION
# ==============================================================================

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile."
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name to use on IAM role created. If null, will use the instance name."
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (iam_role_name or name) is used as a prefix."
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "IAM role path. Must begin and end with a forward slash."
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "Description of the IAM role created for the instance."
  type        = string
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role."
  type        = string
  default     = null
}

variable "iam_role_policies" {
  description = "Policies attached to the IAM role. Map of policy names to policy ARNs."
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "A map of additional tags to add to the IAM role/profile created."
  type        = map(string)
  default     = {}
}

# ==============================================================================
# SECURITY GROUP CONFIGURATION
# ==============================================================================

variable "create_security_group" {
  description = "Determines whether a security group will be created for the instance."
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Name to use on security group created. If null, will use the instance name."
  type        = string
  default     = null
}

variable "security_group_use_name_prefix" {
  description = "Determines whether the security group name (security_group_name or name) is used as a prefix."
  type        = bool
  default     = true
}

variable "security_group_description" {
  description = "Description of the security group created for the instance."
  type        = string
  default     = null
}

variable "security_group_vpc_id" {
  description = "VPC ID to create the security group in. If not set, the security group will be created in the default VPC."
  type        = string
  default     = null
}

variable "security_group_tags" {
  description = "A map of additional tags to add to the security group created."
  type        = map(string)
  default     = {}
}

variable "security_group_egress_rules" {
  description = "Egress rules to add to the security group. Controls outbound traffic from the instance."
  type = map(object({
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string, "tcp")
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
    to_port                      = optional(number)
  }))
  default = {
    ipv4_default = {
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all IPv4 traffic"
      ip_protocol = "-1"
    }
  }
}

variable "security_group_ingress_rules" {
  description = "Ingress rules to add to the security group. Controls inbound traffic to the instance."
  type = map(object({
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string, "tcp")
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
    to_port                      = optional(number)
  }))
  default = null
}

# ==============================================================================
# ELASTIC IP CONFIGURATION
# ==============================================================================

variable "create_eip" {
  description = "Determines whether a public EIP will be created and associated with the instance."
  type        = bool
  default     = false
}

variable "eip_domain" {
  description = "Indicates if this EIP is for use in VPC. Should always be 'vpc' for modern AWS usage."
  type        = string
  default     = "vpc"
  
  validation {
    condition = contains(["vpc", "standard"], var.eip_domain)
    error_message = "EIP domain must be 'vpc' or 'standard'."
  }
}

variable "eip_tags" {
  description = "A map of additional tags to add to the Elastic IP."
  type        = map(string)
  default     = {}
}

# ==============================================================================
# LEGACY/COMPATIBILITY VARIABLES
# ==============================================================================

variable "putin_khuylo" {
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}