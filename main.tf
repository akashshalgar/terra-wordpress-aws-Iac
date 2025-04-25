module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source       = "./modules/subnets"
  vpc_id       = module.vpc.vpc_id
#  vpc_cidr     = module.vpc.vpc_id
  public_cidr  = var.public_cidr
  private_cidr = var.private_cidr
  private_rds  = var.private_rds
  az           = var.az
  az-rds       = var.az-rds
}

module "igw" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source            = "./modules/nat-gateway"
  public_subnet_id  = module.subnets.public_subnet_id
}

module "rds" {
  source              = "./modules/rds"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.subnets.private_subnet_ids
#  private_rds_subnet_id   = module.subnets.private_rds_subnet_id 
#  private_rds_subnet_ids  = module.subnets.private_rds_subnet_id
 # db_subnet_ids       = module.subnets.private_subnet_ids
  db_name             = var.db_name
  db_user             = var.db_user
  db_pass             = var.db_pass
  allow_from_cidr     = var.allow_from_cidr
}

module "route_table" {
  source             = "./modules/route-table"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  nat_id             = module.nat.nat_gateway_id
  public_subnet_id   = module.subnets.public_subnet_id
  private_subnet_ids  = module.subnets.private_subnet_ids
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}


module "ec2" {
  source     = "./modules/ec2"
  ami_id     = var.ami_id
  instance_type     = var.instance_type
  key_name   = var.key_name
  subnet_id  = module.subnets.public_subnet_id
  vpc_security_group_ids = [module.security_group.ec2_sg_id]
  db_host    = module.rds.db_host
  db_name    = var.db_name
  db_user    = var.db_user
  db_pass    = var.db_pass
} 

