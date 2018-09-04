output "instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2.id[0]}"
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${module.ec2.public_dns[0]}"
}

output "ebs_volume_attachment_id" {
  description = "The volume ID"
  value       = "${aws_volume_attachment.this_ec2.volume_id}"
}

output "ebs_volume_attachment_instance_id" {
  description = "The instance ID"
  value       = "${aws_volume_attachment.this_ec2.instance_id}"
}
