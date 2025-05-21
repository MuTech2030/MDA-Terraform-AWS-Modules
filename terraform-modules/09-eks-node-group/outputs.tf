output "node_role_arn" {
  value       = aws_iam_role.node_group_role.arn
  description = "ARN of the IAM role for node group"
}


output "node_group_name" {
  value = aws_eks_node_group.this.node_group_name
}