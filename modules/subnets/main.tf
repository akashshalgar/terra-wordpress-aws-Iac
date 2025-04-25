resource "aws_subnet" "public" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_cidr
  map_public_ip_on_launch = true

  availability_zone = var.az
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_cidr
  availability_zone = var.az
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private_rds" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_rds
  availability_zone = var.az-rds
  tags = {
    Name = "private-subnet"
  }
}

