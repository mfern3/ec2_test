provider "aws" {
  region = "eu-central-1"
}

module "networking" {
  source          = "../modules/networking"
  vpc_cidr_range  = var.vpc_cidr_range
  public_subnet   = var.public_subnet
  private_subnets = var.private_subnets
}

module "ec2" {
  source        = "../modules/ec2"
  vpc-id        = module.networking.vpc_id
  ingress-rules = var.ec2_ingress_rules
  egress-rules  = var.ec2_egress_rules
}

module "rds" {
  source              = "../modules/rds"
  vpc-id              = module.networking.vpc_id
  ec2_security_groups = [module.ec2.sg-id]
  rds_subnet_group    = module.networking.rds_subnet_group
  database_name       = var.database_name
  instance_class      = var.rds_instance_class
}