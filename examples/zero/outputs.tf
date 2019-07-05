locals {
  empty = var.suppress_empty_list && ( length(module.ec2.id) == 0 )
}

output "ids" {
  description = "List of IDs of instances"
  value       = local.empty ? null : module.ec2.id
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = local.empty ? null : module.ec2.public_dns
}

output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = local.empty ? null : module.ec2.vpc_security_group_ids
}

output "tags" {
  description = "List of tags"
  value       = local.empty ? null : module.ec2.tags
}

output "placement_group" {
  description = "List of placement group"
  value       = local.empty ? null : module.ec2.placement_group
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = local.empty ? null : module.ec2.id
}


output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = local.empty ? null : module.ec2.id
}

output "credit_specification" {
  description = "Credit specification of EC2 instance (empty list for not t2 instance types)"
  value       = local.empty ? null : module.ec2.credit_specification
}

