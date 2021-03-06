output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_subnets" {
  value = aws_subnet.private-subnets
}

output "public_subnet" {
  value = aws_subnet.public-subnet.id
}

output "rds_subnet_group" {
  value = aws_db_subnet_group.rds_subnet_group.id
}