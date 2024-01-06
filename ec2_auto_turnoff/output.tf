output "ssh_command" {
  # jangan lupa cd ~/.ssh
  value = "ssh -i ${local.ssh_key_filename}.pem ec2-user@${aws_instance.ec2_instance.public_dns}"
}

output "ssh_command_alternative" {
  # jangan lupa cd ~/.ssh
  value = local.ssh_connect_command
}

output "security_groups" {
  value = local.security_group_ids
}