# EC2 Multiple
output "ec2_multiple" {
  description = "The full output of the `ec2_module` module with `external_ebs_block_device`"
  value       = module.ec2_multiple
}
