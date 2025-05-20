variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    name       = string
    az         = optional(string)  # optional AZ
  }))
  description = "Map of subnet name to CIDR, name, and optional AZ"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
