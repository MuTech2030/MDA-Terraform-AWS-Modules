
# --------------------------
# modules/iam_role/variables.tf
# --------------------------
variable "name" {
  description = "IAM Role name"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the role"
  type        = map(string)
  default     = {}
}