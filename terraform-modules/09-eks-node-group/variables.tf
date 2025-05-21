variable "node_role_name" {
  description = "IAM role name for EKS node group"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the node group IAM role"
  type        = list(string)
}
