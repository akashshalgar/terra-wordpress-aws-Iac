variable "vpc_cidr" {
  description = "Main VPC CIDR block"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr)) && cidrhost(var.vpc_cidr, 0) == split("/", var.vpc_cidr)[0]
    error_message = "Must be valid IPv4 CIDR (e.g., 10.0.0.0/16)"
  }
}

