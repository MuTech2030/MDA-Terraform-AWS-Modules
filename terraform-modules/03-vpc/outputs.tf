output "private_subnet_ids_with_names" {
  description = "Map of subnet names to subnet IDs"
  value = {
    for name, subnet in aws_subnet.private :
    name => subnet.id
  }
}
