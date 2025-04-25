variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs spanning ≥2 AZs"
}

variable "igw_id" {
  type = string
}

variable "nat_id" {
  type = string
}

