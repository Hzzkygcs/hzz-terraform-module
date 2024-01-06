locals {
  instance_type = var.instance_type
  instance_name = var.instance_name

  vpc_id = (var.aws_target_vpc_id != null)? var.aws_target_vpc_id : aws_default_vpc.default_vpc.id

  aws_key_filename = (var.aws_key_filename == null)? var.key_filename : var.aws_key_filename
  key_filename = var.key_filename
  private_key_path = pathexpand("~/.ssh/${local.key_filename}.pem")
  public_key_path = pathexpand("~/.ssh/${local.key_filename}.pub")

  security_groups =  [
    module.security_group.aws_security_group.allow_ssh.id,
    module.security_group.aws_security_group.allow_all_outbound.id,
  ]

  automatic_turn_off = var.automatic_turn_off

  temporary_script_location = var.temporary_script_location
  ssh_connect_command = "ssh -i ${local.key_filename}.pem ec2-user@${aws_instance.ec2_instance.public_ip}"
  cd_and_ssh_connect_command = "cd %USER%/.ssh ; ${local.ssh_connect_command}"

  instance_automatic_turn_off_config = var.automatic_turn_off_config

  # no need to use `resource "local_file" "" {...}` (see  https://stackoverflow.com/a/57469070/7069108 )
  on_first_boot_script = templatefile("${path.module}/on_first_boot_script.tpl", {
    "automatic_turn_off_script_content_in_base64": base64encode(templatefile("${path.module}/automatic_turn_off_script.sh",
      local.instance_automatic_turn_off_config
    ))
  })
}