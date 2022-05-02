variable "vpc_cidr_range" {
}

variable "public_subnet" {
  type = map(any)
  default = {
    az   = "eu-central-1a"
    cidr = "10.0.1.0/24"
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    sub-1 = {
      az   = "eu-central-1b"
      cidr = "10.0.2.0/24"
    }
    sub-2 = {
      az   = "eu-central-1c"
      cidr = "10.0.3.0/24"
    }
  }
}