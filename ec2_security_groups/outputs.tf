
output "aws_security_group" {
  value = {
    "allow_ssh": aws_security_group.allow_ssh,
    "allow_all_outbound": aws_security_group.allow_all_outbound,
  }
}


output "security_group_ids" {
  value = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_all_outbound.id,
  ]
}