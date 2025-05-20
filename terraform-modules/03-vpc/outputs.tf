output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "private_subnet_ids" {
  value       = [for s in aws_subnet.private : s.id]
  description = "IDs of private subnets"
}

output "private_subnet_azs" {
  value       = [for s in aws_subnet.private : s.availability_zone]
  description = "Availability zones of private subnets"
}
