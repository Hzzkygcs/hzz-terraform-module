locals {
  vpc_id = var.vpc_id

  allow_ssh_ec2_name = "allow_ssh_ec2"
  allow_ssh_ec2_display_name = "Allow SSH"
  allow_all_outbound_name = "allow_all_outbound"
  allow_all_outbound_display_name = "Allow All Outbound"

  allow_ssh_ec2_group_id = (
    (length(data.aws_security_groups.allow_ssh_ec2_if_exist.ids) > 0)?
      data.aws_security_groups.allow_ssh_ec2_if_exist.ids[0] : aws_security_group.allow_ssh[0].id
  )
  allow_all_outbound_id = (
    (length(data.aws_security_groups.allow_all_outbound_if_exist.ids) > 0)?
      data.aws_security_groups.allow_all_outbound_if_exist.ids[0] : aws_security_group.allow_all_outbound[0].id
  )
}