
output "aws_security_group" {
  value = {
    "allow_ssh": data.aws_security_group.allow_ssh_ec2
    "allow_all_outbound": data.aws_security_group.allow_all_outbound,
  }
}