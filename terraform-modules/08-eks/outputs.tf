output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "Name of the EKS cluster"
}

output "cluster_arn" {
  value       = aws_eks_cluster.this.arn
  description = "ARN of the EKS cluster"
}
output "role_arn" {
  value       = aws_iam_role.eks_cluster.arn
  description = "IAM role ARN used by EKS"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS cluster endpoint"
}

output "cluster_certificate_authority" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "Base64 encoded certificate data required to communicate with the cluster"
}
