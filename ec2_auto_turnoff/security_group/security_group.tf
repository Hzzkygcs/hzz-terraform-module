resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh_ec2"
  vpc_id = var.vpc_id

  ingress {
    description = "public SSH VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name": "Allow SSH"
  }
}
resource "aws_security_group" "allow_all_outbound" {
  name = "allow_all_outbound"
  vpc_id = var.vpc_id

  egress {
    description = "Allow all outbound connection"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name": "Allow SSH"
  }
}