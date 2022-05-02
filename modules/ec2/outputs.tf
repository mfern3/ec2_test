output "sg-id" {
  value = aws_security_group.ec2-security-group.id
}

output "ec2-ip" {
  value = aws_eip.eip.public_ip
}