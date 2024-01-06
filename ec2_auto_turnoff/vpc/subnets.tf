locals {
  public_subnets  = {
    "public_subnet_a": aws_subnet.public_subnet_a,
    "public_subnet_b": aws_subnet.public_subnet_b,
  }
  private_subnets = {
    "private_subnet_a": aws_subnet.private_subnet_a,
    "private_subnet_b": aws_subnet.private_subnet_b,
  }
}

