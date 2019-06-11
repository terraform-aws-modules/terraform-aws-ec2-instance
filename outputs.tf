locals {
  this_id                           = compact(coalescelist(aws_instance.this.*.id, aws_instance.this_t2.*.id, [""]))
  this_availability_zone            = compact(coalescelist(aws_instance.this.*.availability_zone, aws_instance.this_t2.*.availability_zone, [""]))
  this_key_name                     = compact(coalescelist(aws_instance.this.*.key_name, aws_instance.this_t2.*.key_name, [""]))
  this_public_dns                   = compact(coalescelist(aws_instance.this.*.public_dns, aws_instance.this_t2.*.public_dns, [""]))
  this_public_ip                    = compact(coalescelist(aws_instance.this.*.public_ip, aws_instance.this_t2.*.public_ip, [""]))
  this_primary_network_interface_id = compact(coalescelist(aws_instance.this.*.primary_network_interface_id, aws_instance.this_t2.*.primary_network_interface_id, [""]))
  this_private_dns                  = compact(coalescelist(aws_instance.this.*.private_dns, aws_instance.this_t2.*.private_dns, [""]))
  this_private_ip                   = compact(coalescelist(aws_instance.this.*.private_ip, aws_instance.this_t2.*.private_ip, [""]))
  this_placement_group              = compact(concat(coalescelist(aws_instance.this.*.placement_group, aws_instance.this_t2.*.placement_group), [""]))
  this_security_groups              = coalescelist(aws_instance.this.*.security_groups, aws_instance.this_t2.*.security_groups, [""])
  this_vpc_security_group_ids       = coalescelist(flatten(aws_instance.this.*.vpc_security_group_ids), flatten(aws_instance.this_t2.*.vpc_security_group_ids), [""])
  this_subnet_id                    = compact(coalescelist(aws_instance.this.*.subnet_id, aws_instance.this_t2.*.subnet_id, [""]))
  this_credit_specification         = flatten(aws_instance.this_t2.*.credit_specification)
  this_tags                         = coalescelist(aws_instance.this.*.tags, aws_instance.this_t2.*.tags, [""])
  this_volume_tags                  = coalescelist(aws_instance.this.*.volume_tags, aws_instance.this_t2.*.volume_tags, [""])
}

output "id" {
  description = "List of IDs of instances"
  value       = local.this_id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = local.this_availability_zone
}

output "placement_group" {
  description = "List of placement groups of instances"
  value       = local.this_placement_group
}

output "key_name" {
  description = "List of key names of instances"
  value       = local.this_key_name
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = local.this_public_dns
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = local.this_public_ip
}

output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = local.this_primary_network_interface_id
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = local.this_private_dns
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = local.this_private_ip
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = local.this_security_groups
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = local.this_vpc_security_group_ids
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = local.this_subnet_id
}

output "credit_specification" {
  description = "List of credit specification of instances"
  value       = local.this_credit_specification
}

output "tags" {
  description = "List of tags of instances"
  value       = local.this_tags
}

output "volume_tags" {
  description = "List of tags of volumes of instances"
  value       = local.this_volume_tags
}
