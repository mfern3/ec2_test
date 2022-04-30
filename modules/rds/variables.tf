variable "vpc-id" {}
variable "ec2_security_groups" {}
variable "rds_allocated_storage" {
  default = 10
}
variable "rds_engine" {
  default = "mysql"
}
variable "rds_engine_version" {
  default = "5.7"
}
variable "rds_subnet_group" {}
variable "instance_class" {}
variable "database_name" {}
variable "database_user" {
  default = "user"
}
