output "id" {
  description = "List of IDs of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.id : aws_spot_instance_request.this.*.spot_instance_id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.arn : aws_spot_instance_request.this.*.arn
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.availability_zone : aws_spot_instance_request.this.*.availability_zone
}

output "placement_group" {
  description = "List of placement groups of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.placement_group : aws_spot_instance_request.this.*.placement_group
}

output "key_name" {
  description = "List of key names of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.key_name : aws_spot_instance_request.this.*.key_name
}

output "password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.password_data : aws_spot_instance_request.this.*.password_data
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.public_dns : aws_spot_instance_request.this.*.public_dns
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.public_ip : aws_spot_instance_request.this.*.public_ip
}

output "ipv6_addresses" {
  description = "List of assigned IPv6 addresses of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.ipv6_addresses : aws_spot_instance_request.this.*.ipv6_addresses
}

output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.primary_network_interface_id : aws_spot_instance_request.this.*.primary_network_interface_id
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.private_dns : aws_spot_instance_request.this.*.private_dns
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.private_ip : aws_spot_instance_request.this.*.private_ip
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.security_groups : aws_spot_instance_request.this.*.security_groups
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.vpc_security_group_ids : aws_spot_instance_request.this.*.vpc_security_group_ids
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.subnet_id : aws_spot_instance_request.this.*.subnet_id
}

output "credit_specification" {
  description = "List of credit specification of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.credit_specification : aws_spot_instance_request.this.*.credit_specification
}

output "instance_state" {
  description = "List of instance states of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.instance_state : aws_spot_instance_request.this.*.instance_state
}

output "root_block_device_volume_ids" {
  description = "List of volume IDs of root block devices of instances"
  value       = var.instance_request_type == "on_demand" ? [for device in aws_instance.this.*.root_block_device : device.*.volume_id] : [for device in aws_spot_instance_request.this.*.root_block_device : device.*.volume_id]
}

output "ebs_block_device_volume_ids" {
  description = "List of volume IDs of EBS block devices of instances"
  value       = var.instance_request_type == "on_demand" ? [for device in aws_instance.this.*.ebs_block_device : device.*.volume_id] : [for device in aws_spot_instance_request.this.*.ebs_block_device : device.*.volume_id]
}

output "tags" {
  description = "List of tags of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.tags : aws_spot_instance_request.this.*.tags
}

output "volume_tags" {
  description = "List of tags of volumes of instances"
  value       = var.instance_request_type == "on_demand" ? aws_instance.this.*.volume_tags : aws_spot_instance_request.this.*.volume_tags
}

output "instance_count" {
  description = "Number of instances to launch specified as argument to this module"
  value       = var.instance_count
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = aws_spot_instance_request.this.*.spot_bid_status
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = aws_spot_instance_request.this.*.spot_request_state
}
