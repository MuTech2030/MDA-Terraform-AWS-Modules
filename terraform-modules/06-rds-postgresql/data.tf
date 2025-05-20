data "aws_subnets" "rds_subnets" {
  filter {
    name   = "tag:Name"
    values = var.rds_subnet_names
  }
}