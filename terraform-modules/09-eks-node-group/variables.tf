

variable "node_role_name" {
  description = "IAM role name for EKS node group"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the node group IAM role"
  type        = list(string)
}

variable "cluster_name" {}
variable "node_group_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "desired_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}
variable "instance_types" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}

