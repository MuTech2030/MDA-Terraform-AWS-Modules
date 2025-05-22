
###########################
# MODULE: modules/ssm/outputs.tf
###########################

output "ssm_instance_role_name" {
  value = aws_iam_role.ssm_instance_role.name
}

output "ssm_instance_profile_name" {
  value = aws_iam_instance_profile.ssm_profile.name
}
