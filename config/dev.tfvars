// VPC values
vpc_cidr_range = "10.0.0.0/16"

// Subnets values
public_subnet = {
  az   = "eu-central-1a"
  cidr = "10.0.1.0/24"
}

private_subnets = {
  sub-1 = {
    az   = "eu-central-1b"
    cidr = "10.0.2.0/24"
  }
  sub-2 = {
    az   = "eu-central-1c"
    cidr = "10.0.3.0/24"
  }
}

// Security groups values
ec2_ingress_rules = [
  {
    description     = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
  },
  {
    description     = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
  },
  {
    description     = "MYSQL"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
  },
]

ec2_egress_rules = [
  {
    description = "Egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

// RDS values
database_name         = "test_db"
rds_instance_class    = "db.t2.micro"
rds_engine            = "mysql"
rds_allocated_storage = 10
rds_engine_version    = "5.7"
database_user         = "user"

// EC2 values
instance_type = "t2.micro"