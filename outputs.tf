output "id" {
  description = "The ID of the instance"
  value       = element(concat(aws_instance.this.*.id, aws_spot_instance_request.this.*.id, [""]), 0)
}

output "arn" {
  description = "The ARN of the instance"
  value       = element(concat(aws_instance.this.*.arn, aws_spot_instance_request.this.*.arn, [""]), 0)
}

output "capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = element(concat(aws_instance.this.*.capacity_reservation_specification, aws_spot_instance_request.this.*.capacity_reservation_specification, [""]), 0)
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = element(concat(aws_instance.this.*.instance_state, aws_spot_instance_request.this.*.instance_state, [""]), 0)
}

output "outpost_arn" {
  description = "The ARN of the Outpost the instance is assigned to"
  value       = element(concat(aws_instance.this.*.outpost_arn, aws_spot_instance_request.this.*.outpost_arn, [""]), 0)
}

output "password_data" {
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if `get_password_data` is true"
  value       = element(concat(aws_instance.this.*.password_data, aws_spot_instance_request.this.*.password_data, [""]), 0)
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = element(concat(aws_instance.this.*.primary_network_interface_id, aws_spot_instance_request.this.*.primary_network_interface_id, [""]), 0)
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.this.*.private_dns, aws_spot_instance_request.this.*.private_dns, [""]), 0)
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.this.*.public_dns, aws_spot_instance_request.this.*.public_dns, [""]), 0)
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = element(concat(aws_instance.this.*.public_ip, aws_spot_instance_request.this.*.public_ip, [""]), 0)
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = element(concat(aws_instance.this.*.private_ip, aws_spot_instance_request.this.*.private_ip, [""]), 0)
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = element(concat(aws_instance.this.*.tags_all, aws_spot_instance_request.this.*.tags_all, [""]), 0)
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request"
  value       = element(concat(aws_spot_instance_request.this.*.spot_bid_status, [""]), 0)
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request"
  value       = element(concat(aws_spot_instance_request.this.*.spot_request_state, [""]), 0)
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
  value       = element(concat(aws_spot_instance_request.this.*.spot_instance_id, [""]), 0)
}
