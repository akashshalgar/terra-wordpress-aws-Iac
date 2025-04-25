variable "db_name" {
  description = "WordPress database name"
  type        = string
}

variable "db_user" {
  description = "Database master username"
  type        = string
}

variable "db_pass" {
  description = "Database master password (min 12 chars)"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.db_pass) >= 12
    error_message = "Password must be at least 12 characters long"
  }
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs spanning ≥2 AZs"
}
#  type        = string
#  description = "Public subnet to launch NAT Gateway in"
#}

#variable "private_rds_subnet_id" {
#  type        = string
#  description = "Private subnet for rds second availability zone"
#}

variable "allow_from_cidr" {
  description = "CIDR block that can access the RDS instance"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where RDS will be deployed"
  type        = string
}

