output "id" {
  description = "List of IDs of instances"
  value       = ["${aws_spot_instance_request.this.*.id}"]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = ["${aws_spot_instance_request.this.*.public_dns}"]
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_spot_instance_request.this.*.public_ip}"]
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = ["${aws_spot_instance_request.this.*.private_dns}"]
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = ["${aws_spot_instance_request.this.*.private_ip}"]
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request."
  value       = ["${aws_spot_instance_request.this.*.spot_bid_status}"]
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request."
  value       = ["${aws_spot_instance_request.this.*.spot_request_state}"]
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request."
  value       = ["${aws_spot_instance_request.this.*.spot_instance_id}"]
}
