resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_range
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet["cidr"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.public_subnet["az"]
}

resource "aws_subnet" "private-subnets" {
  for_each                = var.private_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value["cidr"]
  map_public_ip_on_launch = "false"
  availability_zone       = each.value["az"]
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  subnet_ids = [
    aws_subnet.private-subnets["sub-1"].id,
    aws_subnet.private-subnets["sub-2"].id
  ]
}