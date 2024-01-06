data "aws_security_groups" "allow_all_outbound_if_exist"{
  filter {
    name   = "group-name"
    values = [local.allow_all_outbound_name]
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
}

data "aws_security_groups" "allow_ssh_ec2_if_exist"{
  filter {
    name   = "group-name"
    values = [local.allow_ssh_ec2_name]
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
}

data "aws_security_group" "allow_ssh_ec2"{
  id=local.allow_ssh_ec2_group_id
  depends_on = [aws_security_group.allow_ssh]
}
data "aws_security_group" "allow_all_outbound"{
  id=local.allow_all_outbound_id
  depends_on = [aws_security_group.allow_all_outbound]
}