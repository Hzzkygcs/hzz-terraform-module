resource "aws_internet_gateway" "internet_gateway" {
  # It’s a part of VPC which establishes communication between the VPC and Internet .
  vpc_id = aws_vpc.ec2_vpc.id
  tags = {
    "Name": "demo-internet-gateway"
  }
}