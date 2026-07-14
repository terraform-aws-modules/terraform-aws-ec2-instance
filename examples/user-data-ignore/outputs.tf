output "user_data_instance_id" {
  description = "The ID of the instance created with `user_data` and `ignore_user_data_changes` enabled"
  value       = module.ec2_user_data.id
}

output "user_data_base64_instance_id" {
  description = "The ID of the instance created with `user_data_base64` and `ignore_user_data_changes` enabled"
  value       = module.ec2_user_data_base64.id
}

output "user_data_not_ignored_instance_id" {
  description = "The ID of the instance created with `user_data` and `ignore_user_data_changes` disabled"
  value       = module.ec2_user_data_not_ignored.id
}
