#######################################
# 01 - EKS_IAM_Role*Policy*Attachement*EKS_Control_Plane Module
#######################################
# modules/eks_iam_role/main.tf
resource "aws_iam_role" "eks_cluster" {
  name = var.eks_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}


resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.role_arn
  version  = var.k8s_version

  vpc_config {
    subnet_ids             = var.subnet_ids
    security_group_ids     = var.security_group_ids
    endpoint_public_access = true
  }

  tags = var.tags
}


