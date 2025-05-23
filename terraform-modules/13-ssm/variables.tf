
###########################
# MODULE: modules/ssm/variables.tf
###########################

variable "instance_role_name" {
  type        = string
  description = "Name for the EC2 instance role"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to IAM resources"
}
