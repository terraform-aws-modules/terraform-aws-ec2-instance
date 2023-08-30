# EC2 Complete
output "ec2_complete_id" {
  description = "The ID of the instance"
  value       = module.ec2_complete.id
}

output "ec2_complete_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_complete.arn
}

output "ec2_complete_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_complete.capacity_reservation_specification
}

output "ec2_complete_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_complete.instance_state
}

output "ec2_complete_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_complete.primary_network_interface_id
}

output "ec2_complete_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_complete.private_dns
}

output "ec2_complete_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_complete.public_dns
}

output "ec2_complete_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_complete.public_ip
}

output "ec2_complete_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_complete.tags_all
}

output "ec2_complete_iam_role_name" {
  description = "The name of the IAM role"
  value       = module.ec2_complete.iam_role_name
}

output "ec2_complete_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = module.ec2_complete.iam_role_arn
}

output "ec2_complete_iam_role_unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = module.ec2_complete.iam_role_unique_id
}

output "ec2_complete_iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = module.ec2_complete.iam_instance_profile_arn
}

output "ec2_complete_iam_instance_profile_id" {
  description = "Instance profile's ID"
  value       = module.ec2_complete.iam_instance_profile_id
}

output "ec2_complete_iam_instance_profile_unique" {
  description = "Stable and unique string identifying the IAM instance profile"
  value       = module.ec2_complete.iam_instance_profile_unique
}

output "ec2_complete_root_block_device" {
  description = "Root block device information"
  value       = module.ec2_complete.root_block_device
}

output "ec2_complete_ebs_block_device" {
  description = "EBS block device information"
  value       = module.ec2_complete.ebs_block_device
}

output "ec2_complete_ephemeral_block_device" {
  description = "Ephemeral block device information"
  value       = module.ec2_complete.ephemeral_block_device
}

output "ec2_complete_availability_zone" {
  description = "The availability zone of the created instance"
  value       = module.ec2_complete.availability_zone
}

# EC2 T2 Unlimited
output "ec2_t2_unlimited_id" {
  description = "The ID of the instance"
  value       = module.ec2_t2_unlimited.id
}

output "ec2_t2_unlimited_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_t2_unlimited.arn
}

output "ec2_t2_unlimited_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_t2_unlimited.capacity_reservation_specification
}

output "ec2_t2_unlimited_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_t2_unlimited.instance_state
}

output "ec2_t2_unlimited_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_t2_unlimited.primary_network_interface_id
}

output "ec2_t2_unlimited_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_t2_unlimited.private_dns
}

output "ec2_t2_unlimited_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_t2_unlimited.public_dns
}

output "ec2_t2_unlimited_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_t2_unlimited.public_ip
}

output "ec2_t2_unlimited_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_t2_unlimited.tags_all
}

output "ec2_t2_unlimited_availability_zone" {
  description = "The availability zone of the created instance"
  value       = module.ec2_t2_unlimited.availability_zone
}

# EC2 T3 Unlimited
output "ec2_t3_unlimited_id" {
  description = "The ID of the instance"
  value       = module.ec2_t3_unlimited.id
}

output "ec2_t3_unlimited_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_t3_unlimited.arn
}

output "ec2_t3_unlimited_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_t3_unlimited.capacity_reservation_specification
}

output "ec2_t3_unlimited_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_t3_unlimited.instance_state
}

output "ec2_t3_unlimited_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_t3_unlimited.primary_network_interface_id
}

output "ec2_t3_unlimited_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_t3_unlimited.private_dns
}

output "ec2_t3_unlimited_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_t3_unlimited.public_dns
}

output "ec2_t3_unlimited_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_t3_unlimited.public_ip
}

output "ec2_t3_unlimited_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_t3_unlimited.tags_all
}

output "ec2_t3_unlimited_availability_zone" {
  description = "The availability zone of the created instance"
  value       = module.ec2_t3_unlimited.availability_zone
}

# EC2 with ignore AMI changes
output "ec2_ignore_ami_changes_ami" {
  description = "The AMI of the instance (ignore_ami_changes = true)"
  value       = module.ec2_ignore_ami_changes.ami
}

# EC2 Multiple
output "ec2_multiple" {
  description = "The full output of the `ec2_module` module"
  value       = module.ec2_multiple
}

# EC2 Spot Instance
output "ec2_spot_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_spot_instance.id
}

output "ec2_spot_instance_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_spot_instance.arn
}

output "ec2_spot_instance_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_spot_instance.capacity_reservation_specification
}

output "ec2_spot_instance_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_spot_instance.instance_state
}

output "ec2_spot_instance_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_spot_instance.primary_network_interface_id
}

output "ec2_spot_instance_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_spot_instance.private_dns
}

output "ec2_spot_instance_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_spot_instance.public_dns
}

output "ec2_spot_instance_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_spot_instance.public_ip
}

output "ec2_spot_instance_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_spot_instance.tags_all
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = module.ec2_spot_instance.spot_bid_status
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = module.ec2_spot_instance.spot_request_state
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = module.ec2_spot_instance.spot_instance_id
}

output "spot_instance_availability_zone" {
  description = "The availability zone of the created spot instance"
  value       = module.ec2_spot_instance.availability_zone
}
