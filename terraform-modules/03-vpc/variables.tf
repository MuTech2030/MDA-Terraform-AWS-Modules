variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    name       = string
  }))
  description = "Map of AZ to subnet CIDR and name"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
