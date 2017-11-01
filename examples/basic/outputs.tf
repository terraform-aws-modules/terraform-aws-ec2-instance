output "id" {
  description = "List of IDs of instances"
  value       = ["${module.ec2_spot.id}"]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = ["${module.ec2_spot.public_dns}"]
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${module.ec2_spot.public_ip}"]
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = ["${module.ec2_spot.private_dns}"]
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = ["${module.ec2_spot.private_ip}"]
}

output "spot_bid_status" {
  description = "The current bid status of the Spot Instance Request."
  value       = ["${module.ec2_spot.spot_bid_status}"]
}

output "spot_request_state" {
  description = "The current request state of the Spot Instance Request."
  value       = ["${module.ec2_spot.spot_request_state}"]
}

output "spot_instance_id" {
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request."
  value       = ["${module.ec2_spot.spot_instance_id}"]
}
