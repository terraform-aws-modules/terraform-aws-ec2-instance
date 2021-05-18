output "instances_public_ips" {
  description = "Public IPs assigned to the EC2 instance"
  value       = module.ec2.public_ip
}

output "ebs_volume_attachment_id" {
  description = "The volume ID"
  value       = aws_volume_attachment.this.*.volume_id
}

output "ebs_volume_attachment_instance_id" {
  description = "The instance ID"
  value       = aws_volume_attachment.this.*.instance_id
}

