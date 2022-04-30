resource "aws_security_group" "ec2-security-group" {
  vpc_id = var.vpc-id

  dynamic "ingress" {
    for_each = var.ingress-rules
    content {
      description     = ingress.value["description"]
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      cidr_blocks     = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.egress-rules
    content {
      description     = egress.value["description"]
      from_port       = egress.value["from_port"]
      to_port         = egress.value["to_port"]
      protocol        = egress.value["protocol"]
      cidr_blocks     = egress.value["cidr_blocks"]
    }
  }
}