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
  name     = var.eks_control_plane_name
role_arn = aws_iam_role.eks_cluster.arn
  version  = var.k8s_version
  access_config {
    authentication_mode                        = "CONFIG_MAP_ONLY"
    bootstrap_cluster_creator_admin_permissions = true
  }
  vpc_config {
    subnet_ids             = var.subnet_ids
    security_group_ids     = var.security_group_ids
    endpoint_public_access = true
  }

  tags = var.tags
}




resource "aws_eks_access_entry" "this" {
  for_each    = { for r in var.aws_auth_roles : r.username => r }
  cluster_name = aws_eks_cluster.this.name
  principal_arn = each.value.rolearn
  type         = "STANDARD"
}

resource "aws_eks_access_policy_association" "this" {
  for_each        = { for r in var.aws_auth_roles : r.username => r }
  cluster_name    = aws_eks_cluster.this.name
  principal_arn   = each.value.rolearn
  policy_arn      = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  access_scope {
    type = "cluster"
  }
}
