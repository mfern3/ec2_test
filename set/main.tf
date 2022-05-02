provider "aws" {
  region = "eu-central-1"
}

module "networking" {
  source          = "../modules/networking"
  vpc_cidr_range  = var.vpc_cidr_range
  public_subnet   = var.public_subnet
  private_subnets = var.private_subnets
}

module "rds" {
  source                = "../modules/rds"
  vpc-id                = module.networking.vpc_id
  ec2_security_groups   = [module.ec2.sg-id]
  rds_subnet_group      = module.networking.rds_subnet_group
  database_name         = var.database_name
  instance_class        = var.rds_instance_class
  database_user         = var.database_user
  rds_allocated_storage = var.rds_allocated_storage
  rds_engine            = var.rds_engine
  rds_engine_version    = var.rds_engine_version
}

module "ec2" {
  source        = "../modules/ec2"
  vpc-id        = module.networking.vpc_id
  ingress-rules = var.ec2_ingress_rules
  egress-rules  = var.ec2_egress_rules
  subnet-id     = module.networking.public_subnet
  instance-type = var.instance_type
  user-data     = module.rds.user-data

}

output "INFO" {
  value = "http://${module.ec2.ec2-ip}"
}