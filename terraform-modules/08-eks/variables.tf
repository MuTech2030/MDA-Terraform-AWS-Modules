variable "eks_iam_role_name" {
  type = string
  description = "the name of the eks IAM role"
}
variable "eks_control_plane_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the cluster"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the cluster"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the cluster"
  type        = map(string)
  default     = {}
}
