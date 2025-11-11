# ==============================================================================
# STANDARDIZED OUTPUT DEFINITIONS
# ==============================================================================
# This file uses the standardized module name "ec2_instance" for consistent
# references. All outputs follow the pattern: module.ec2_instance.*
# This ensures LLM can reliably generate correct output references.
# ==============================================================================

# ==============================================================================
# INSTANCE INFORMATION OUTPUTS
# ==============================================================================

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = module.ec2_instance.arn
}

output "instance_state" {
  description = "The state of the instance (pending, running, shutting-down, terminated, stopping, stopped)"
  value       = module.ec2_instance.instance_state
}

output "availability_zone" {
  description = "The availability zone of the instance"
  value       = module.ec2_instance.availability_zone
}

output "placement_group" {
  description = "The placement group of the instance"
  value       = module.ec2_instance.placement_group
}

output "capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_instance.capacity_reservation_specification
}

# ==============================================================================
# NETWORK INFORMATION OUTPUTS
# ==============================================================================

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value       = module.ec2_instance.private_ip
}

output "public_ip" {
  description = "The public IP address assigned to the instance (if applicable)"
  value       = module.ec2_instance.public_ip
}

output "private_dns" {
  description = "The private DNS name assigned to the instance"
  value       = module.ec2_instance.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance"
  value       = module.ec2_instance.public_dns
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_instance.primary_network_interface_id
}

output "security_groups" {
  description = "List of security group IDs associated with the instance"
  value       = module.ec2_instance.security_groups
}

output "vpc_security_group_ids" {
  description = "List of VPC security group IDs associated with the instance"
  value       = module.ec2_instance.vpc_security_group_ids
}

# ==============================================================================
# SECURITY INFORMATION OUTPUTS
# ==============================================================================

output "iam_role_name" {
  description = "The name of the IAM role attached to the instance"
  value       = module.ec2_instance.iam_role_name
}

output "iam_role_arn" {
  description = "The ARN of the IAM role attached to the instance"
  value       = module.ec2_instance.iam_role_arn
}

output "iam_role_unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = module.ec2_instance.iam_role_unique_id
}

output "iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = module.ec2_instance.iam_instance_profile_arn
}

output "iam_instance_profile_id" {
  description = "Instance profile's ID"
  value       = module.ec2_instance.iam_instance_profile_id
}

output "iam_instance_profile_unique" {
  description = "Stable and unique string identifying the IAM instance profile"
  value       = module.ec2_instance.iam_instance_profile_unique
}

output "security_group_arn" {
  description = "ARN of the security group created by the module"
  value       = module.ec2_instance.security_group_arn
}

output "security_group_id" {
  description = "ID of the security group created by the module"
  value       = module.ec2_instance.security_group_id
}

# ==============================================================================
# STORAGE INFORMATION OUTPUTS
# ==============================================================================

output "root_block_device" {
  description = "Root block device information"
  value       = module.ec2_instance.root_block_device
  sensitive   = false
}

output "ebs_block_device" {
  description = "EBS block device information"
  value       = module.ec2_instance.ebs_block_device
  sensitive   = false
}

output "ephemeral_block_device" {
  description = "Ephemeral block device information"
  value       = module.ec2_instance.ephemeral_block_device
  sensitive   = false
}

# ==============================================================================
# SPOT INSTANCE OUTPUTS
# ==============================================================================

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = module.ec2_instance.spot_bid_status
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = module.ec2_instance.spot_request_state
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = module.ec2_instance.spot_instance_id
}

# ==============================================================================
# ELASTIC IP OUTPUTS
# ==============================================================================

output "eip_id" {
  description = "Contains the EIP allocation ID"
  value       = module.ec2_instance.eip_id
}

output "eip_association_id" {
  description = "Contains the EIP association ID"
  value       = module.ec2_instance.eip_association_id
}

output "eip_domain" {
  description = "Indicates if this EIP is for use in VPC"
  value       = module.ec2_instance.eip_domain
}

output "eip_public_dns" {
  description = "Public DNS associated with the Elastic IP address"
  value       = module.ec2_instance.eip_public_dns
}

output "eip_public_ip" {
  description = "Contains the public IP address"
  value       = module.ec2_instance.eip_public_ip
}

# ==============================================================================
# ADDITIONAL METADATA OUTPUTS
# ==============================================================================

output "ami" {
  description = "The AMI ID used for the instance"
  value       = module.ec2_instance.ami
}

output "instance_type" {
  description = "The instance type used for the instance"
  value       = module.ec2_instance.instance_type
}

output "key_name" {
  description = "The key name used for the instance"
  value       = module.ec2_instance.key_name
}

output "monitoring" {
  description = "Whether detailed monitoring is enabled"
  value       = module.ec2_instance.monitoring
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider"
  value       = module.ec2_instance.tags_all
  sensitive   = false
}

# ==============================================================================
# CPU AND PERFORMANCE OUTPUTS
# ==============================================================================

output "cpu_options" {
  description = "The CPU options of the instance"
  value       = module.ec2_instance.cpu_options
  sensitive   = false
}

output "credit_specification" {
  description = "Credit specification of the instance"
  value       = module.ec2_instance.credit_specification
  sensitive   = false
}

# ==============================================================================
# AGGREGATED OUTPUTS FOR AUTOMATION
# ==============================================================================

output "instance_summary" {
  description = "Summary of key instance information for automation and monitoring"
  value = {
    id                = module.ec2_instance.id
    arn               = module.ec2_instance.arn
    instance_type     = module.ec2_instance.instance_type
    availability_zone = module.ec2_instance.availability_zone
    private_ip        = module.ec2_instance.private_ip
    public_ip         = module.ec2_instance.public_ip
    state             = module.ec2_instance.instance_state
    monitoring        = module.ec2_instance.monitoring
  }
  sensitive = false
}

output "network_summary" {
  description = "Summary of network configuration for automation"
  value = {
    private_ip                    = module.ec2_instance.private_ip
    public_ip                     = module.ec2_instance.public_ip
    private_dns                   = module.ec2_instance.private_dns
    public_dns                    = module.ec2_instance.public_dns
    primary_network_interface_id  = module.ec2_instance.primary_network_interface_id
    security_groups               = module.ec2_instance.security_groups
  }
  sensitive = false
}

output "security_summary" {
  description = "Summary of security configuration for compliance reporting"
  value = {
    iam_role_arn              = module.ec2_instance.iam_role_arn
    iam_instance_profile_arn  = module.ec2_instance.iam_instance_profile_arn
    security_group_id         = module.ec2_instance.security_group_id
    key_name                  = module.ec2_instance.key_name
  }
  sensitive = false
}