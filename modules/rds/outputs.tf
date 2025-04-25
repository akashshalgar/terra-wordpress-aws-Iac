output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.wordpress.id
}

output "db_endpoint" {
  description = "RDS connection endpoint"
  value       = aws_db_instance.wordpress.endpoint
}

output "db_port" {
  description = "Port to connect to the database"
  value       = aws_db_instance.wordpress.port
}


output "db_user" {
  description = "Database master username"
  value       = aws_db_instance.wordpress.username
}

output "db_subnet_group" {
  description = "RDS subnet group name"
  value       = aws_db_subnet_group.db.name
}

output "db_host" {
  description = "The hostname of the RDS database"
  value       = aws_db_instance.wordpress.address
}

