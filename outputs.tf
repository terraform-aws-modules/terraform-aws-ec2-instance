output "id" {
  description = "The ID of the instance"
  value = try(
    aws_instance.this[0].id,
    aws_instance.ignore_ami[0].id,
    aws_spot_instance_request.this[0].id,
    null,
  )
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    aws_instance.this[0].arn,
    aws_instance.ignore_ami[0].arn,
    aws_spot_instance_request.this[0].arn,
    null,
  )
}

output "capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value = try(
    aws_instance.this[0].capacity_reservation_specification,
    aws_instance.ignore_ami[0].capacity_reservation_specification,
    aws_spot_instance_request.this[0].capacity_reservation_specification,
    null,
  )
}

output "instance_state" {
  description = "The state of the instance"
  value = try(
    aws_instance.this[0].instance_state,
    aws_instance.ignore_ami[0].instance_state,
    aws_spot_instance_request.this[0].instance_state,
    null,
  )
}

output "outpost_arn" {
  description = "The ARN of the Outpost the instance is assigned to"
  value = try(
    aws_instance.this[0].outpost_arn,
    aws_instance.ignore_ami[0].outpost_arn,
    aws_spot_instance_request.this[0].outpost_arn,
    null,
  )
}

output "password_data" {
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if `get_password_data` is true"
  value = try(
    aws_instance.this[0].password_data,
    aws_instance.ignore_ami[0].password_data,
    aws_spot_instance_request.this[0].password_data,
    null,
  )
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value = try(
    aws_instance.this[0].primary_network_interface_id,
    aws_instance.ignore_ami[0].primary_network_interface_id,
    aws_spot_instance_request.this[0].primary_network_interface_id,
    null,
  )
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value = try(
    aws_instance.this[0].private_dns,
    aws_instance.ignore_ami[0].private_dns,
    aws_spot_instance_request.this[0].private_dns,
    null,
  )
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value = try(
    aws_instance.this[0].public_dns,
    aws_instance.ignore_ami[0].public_dns,
    aws_spot_instance_request.this[0].public_dns,
    null,
  )
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value = try(
    aws_eip.this[0].public_ip,
    aws_instance.this[0].public_ip,
    aws_instance.ignore_ami[0].public_ip,
    aws_spot_instance_request.this[0].public_ip,
    null,
  )
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value = try(
    aws_instance.this[0].private_ip,
    aws_instance.ignore_ami[0].private_ip,
    aws_spot_instance_request.this[0].private_ip,
    null,
  )
}

output "ipv6_addresses" {
  description = "The IPv6 address assigned to the instance, if applicable"
  value = try(
    aws_instance.this[0].ipv6_addresses,
    aws_instance.ignore_ami[0].ipv6_addresses,
    aws_spot_instance_request.this[0].ipv6_addresses,
    [],
  )
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value = try(
    aws_instance.this[0].tags_all,
    aws_instance.ignore_ami[0].tags_all,
    aws_spot_instance_request.this[0].tags_all,
    {},
  )
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = try(aws_spot_instance_request.this[0].spot_bid_status, null)
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = try(aws_spot_instance_request.this[0].spot_request_state, null)
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = try(aws_spot_instance_request.this[0].spot_instance_id, null)
}

output "ami" {
  description = "AMI ID that was used to create the instance"
  value = try(
    aws_instance.this[0].ami,
    aws_instance.ignore_ami[0].ami,
    aws_spot_instance_request.this[0].ami,
    null,
  )
}

output "availability_zone" {
  description = "The availability zone of the created instance"
  value = try(
    aws_instance.this[0].availability_zone,
    aws_instance.ignore_ami[0].availability_zone,
    aws_spot_instance_request.this[0].availability_zone,
    null,
  )
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = try(aws_iam_role.this[0].name, null)
}

output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = try(aws_iam_role.this[0].arn, null)
}

output "iam_role_unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = try(aws_iam_role.this[0].unique_id, null)
}

output "iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = try(aws_iam_instance_profile.this[0].arn, null)
}

output "iam_instance_profile_id" {
  description = "Instance profile's ID"
  value       = try(aws_iam_instance_profile.this[0].id, null)
}

output "iam_instance_profile_unique" {
  description = "Stable and unique string identifying the IAM instance profile"
  value       = try(aws_iam_instance_profile.this[0].unique_id, null)
}

################################################################################
# Block Devices
################################################################################
output "root_block_device" {
  description = "Root block device information"
  value = try(
    aws_instance.this[0].root_block_device,
    aws_instance.ignore_ami[0].root_block_device,
    aws_spot_instance_request.this[0].root_block_device,
    null
  )
}

output "ebs_block_device" {
  description = "EBS block device information"
  value = try(
    aws_instance.this[0].ebs_block_device,
    aws_instance.ignore_ami[0].ebs_block_device,
    aws_spot_instance_request.this[0].ebs_block_device,
    null
  )
}

output "ephemeral_block_device" {
  description = "Ephemeral block device information"
  value = try(
    aws_instance.this[0].ephemeral_block_device,
    aws_instance.ignore_ami[0].ephemeral_block_device,
    aws_spot_instance_request.this[0].ephemeral_block_device,
    null
  )
}
