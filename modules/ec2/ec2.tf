resource "aws_instance" "ec2" {
  ami             = data.aws_ami.ami-linux.id
  instance_type   = var.instance-type
  subnet_id       = var.subnet-id
  security_groups = [aws_security_group.ec2-security-group.id]
  user_data       = var.user-data
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
}