variable "vpc_cidr" {
  type = string
}

variable "private_subnet_map" {
  type = map(string)
  description = "Map of AZ to CIDR block for private subnets"
}

variable "name_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}
