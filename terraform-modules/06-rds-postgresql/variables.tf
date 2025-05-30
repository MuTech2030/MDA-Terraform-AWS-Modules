variable "allocated_storage" {
  type = number
}

variable "engine" {
  type = string
}



variable "aws_db_subnet_group_name_id" {
    type = list(string)
  
}
variable "aws_db_subnet_group_name" {
  type = string
}
variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type    = string
  default = ""
}

variable "skip_final_snapshot" {
  type = bool
}

variable "publicly_accessible" {
  type = bool
}



variable "vpc_security_group_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
