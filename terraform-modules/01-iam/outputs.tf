
# --------------------------
# modules/iam_role/output.tf
# --------------------------
output "role_name" {
  value = aws_iam_role.this.name
}

output "role_arn" {
  value = aws_iam_role.this.arn
}
