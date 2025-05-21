resource "aws_iam_role" "node_group_role" {
  name = var.node_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  count      = length(var.policy_arns)
  role       = aws_iam_role.node_group_role.name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types

  tags = var.tags
}