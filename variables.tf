variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # Mumbai region as default
}

variable "access_key" {
  description = "AWS Access Key (use AWS CLI/config instead)"
  type        = string
  sensitive   = true
  default     = null # Recommended: Use AWS_PROFILE environment variable
}

variable "secret_key" {
  description = "AWS Secret Key (use AWS CLI/config instead)"
  type        = string
  sensitive   = true
  default     = null # Recommended: Use AWS_PROFILE environment variable
}


variable "vpc_cidr" {
  description = "Main VPC CIDR block"
  type        = string
}
variable "public_cidr" {}
variable "private_cidr" {}
variable "private_rds" {}
variable "az-rds" {
  description = "Single AZ"
  type        = string
}
variable "az" {
  description = "Single AZ"
  type        = string
}

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

variable "key_name" {
  description = "Key pair name for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "allow_from_cidr" {
  description = "CIDR block that can access the RDS instance"
  type        = list(string)
}

