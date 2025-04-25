variable "vpc_id" {}
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

