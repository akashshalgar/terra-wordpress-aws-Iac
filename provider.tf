provider "aws" {
  region  = var.region
#  profile = "dev"
  access_key = var.access_key
  secret_key = var.secret_key
}

