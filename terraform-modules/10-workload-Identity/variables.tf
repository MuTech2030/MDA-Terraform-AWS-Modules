variable "cluster_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "k8s_namespace" {
  type = string
}

variable "k8s_service_account" {
  type = string
}

variable "policy_arns" {
  type = list(string)
}

variable "thumbprint" {
  description = "OIDC provider thumbprint, usually 9e99a48a9960b14926bb7f3b02e22da0afd6e3bb"
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}
variable "eks_control_plane_dependency" {
  description = "Fake variable to use as a depends_on workaround"
  type        = any
}

