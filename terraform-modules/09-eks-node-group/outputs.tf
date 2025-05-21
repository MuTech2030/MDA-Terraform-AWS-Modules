output "node_role_arn" {
  value       = aws_iam_role.node_group_role.arn
  description = "ARN of the IAM role for node group"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
