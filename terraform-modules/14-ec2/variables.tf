

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name to attach"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the instance"
  default     = {}
}
