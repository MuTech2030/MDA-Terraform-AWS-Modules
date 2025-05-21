#######################################
# 01 - EKS_IAM_Role Module
#######################################
# modules/eks_iam_role/main.tf
resource "aws_iam_role" "eks_cluster" {
  name = var.name
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}

variable "name" {
  type = "string"
  description = "the name of the eks IAM role"
}

resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

