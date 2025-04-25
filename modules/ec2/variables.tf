variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}


variable "key_name" {
  description = "Key pair name to use for the instance"
  type        = string
}

variable "user_data" {
  description = "User data script to provision the EC2 instance"
  type        = string
  default     = ""
}

variable "db_host" {
  description = "The database host for the EC2 instance"
  type        = string
}

variable "db_name" {
  description = "The database name for the EC2 instance"
  type        = string
}

variable "db_user" {
  description = "The database username for the EC2 instance"
  type        = string
}

variable "db_pass" {
  description = "The database password for the EC2 instance"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "The security groups to associate with the EC2 instance"
  type        = list(string)
}

