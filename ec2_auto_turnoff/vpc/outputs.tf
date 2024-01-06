output "public_subnet_a" {
  value = aws_subnet.public_subnet_a
}

output "aws_security_group" {
  value = {
    "allow_ssh": aws_security_group.allow_ssh,
    "allow_all_outbound": aws_security_group.allow_all_outbound,
  }
}