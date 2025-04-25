output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id  # Replace with your actual resource reference
}

output "private_subnet_ids" {
  description = "ID of the private subnet"
  value       = [
    aws_subnet.private.id,
    aws_subnet.private_rds.id
  ]
}

#output "private_rds_subnet_id" {
#  description = "ID of the private subnet"
#  value       = aws_subnet.private.id  # Replace with your actual resource reference
#}

output "public_subnet_cidr" {
  value = var.public_cidr
}
 
