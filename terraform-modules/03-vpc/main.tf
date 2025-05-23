#######################################
# VPC with Private Subnets Only
#######################################
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block

  # Use the provided AZ if set, otherwise omit AZ (AWS will pick one)
  availability_zone = lookup(each.value, "az", null)

  tags = merge(var.tags, {
    Name = each.value.name
  })
}
