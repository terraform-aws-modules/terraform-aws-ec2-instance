output "ids" {
  description = "List of IDs of instances"
  value       = module.ec2.id
}

output "ids_t2" {
  description = "List of IDs of t2-type instances"
  value       = module.ec2_with_t2_unlimited.id
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2.public_dns
}

output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.ec2.vpc_security_group_ids
}

output "root_block_device_volume_ids" {
  description = "List of volume IDs of root block devices of instances"
  value       = module.ec2.root_block_device_volume_ids
}

output "ebs_block_device_volume_ids" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = module.ec2.ebs_block_device_volume_ids
}

output "tags" {
  description = "List of tags"
  value       = module.ec2.tags
}

output "placement_group" {
  description = "List of placement group"
  value       = module.ec2.placement_group
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.id[0]
}

output "t2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_with_t2_unlimited.id[0]
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2.public_dns[0]
}

output "credit_specification" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = module.ec2.credit_specification
}

output "credit_specification_t2_unlimited" {
  description = "Credit specification of t2-type EC2 instance"
  value       = module.ec2_with_t2_unlimited.credit_specification
}

output "metadata_options" {
  description = "Metadata options for the instance"
  value       = module.ec2.metadata_options
}

output "metadata_options_custom" {
  description = "Customized metadata options for the instance"
  value       = module.ec2_with_metadata_options.metadata_options
}
