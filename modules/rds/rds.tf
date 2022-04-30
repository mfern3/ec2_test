resource "aws_security_group" "rds-security-group" {
  vpc_id = var.vpc-id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.ec2_security_groups
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "random_password" "database_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "rds" {
  allocated_storage      = var.rds_allocated_storage
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.instance_class
  db_subnet_group_name   = var.rds_subnet_group
  vpc_security_group_ids = [aws_security_group.rds-security-group.id]
  db_name                = var.database_name
  username               = var.database_user
  password               = random_password.database_password.result
  skip_final_snapshot    = true
}

