resource "aws_iam_role" "node_group_role" {
  name = var.node_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  count      = length(var.policy_arns)
  role       = aws_iam_role.node_group_role.name
  policy_arn = var.policy_arns[count.index]
}
