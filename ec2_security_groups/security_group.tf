resource "aws_security_group" "allow_ssh" {
  name = local.allow_ssh_ec2_name
  vpc_id = local.vpc_id

  ingress {
    description = "public SSH VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name": local.allow_ssh_ec2_display_name
  }
}
resource "aws_security_group" "allow_all_outbound" {
  name = local.allow_all_outbound_name
  vpc_id = local.vpc_id

  egress {
    description = "Allow all outbound connection"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name": local.allow_all_outbound_display_name
  }
}