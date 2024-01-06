resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.ec2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {"Name": "public_route_table"}
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.ec2_vpc.id

  tags = {"Name": "private_route_table"}
}