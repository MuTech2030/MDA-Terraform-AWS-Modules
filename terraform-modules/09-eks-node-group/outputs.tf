output "node_role_arn" {
  value       = aws_iam_role.node_group_role.arn
  description = "ARN of the IAM role for node group"
}
