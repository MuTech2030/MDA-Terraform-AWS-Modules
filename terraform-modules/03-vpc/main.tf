#######################################
# VPC with Private Subnets Only
#######################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags
}

resource "aws_subnet" "private" {
  for_each = { for az, cidr in var.private_subnet_map : az => cidr }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-private-${each.key}"
  })
}
