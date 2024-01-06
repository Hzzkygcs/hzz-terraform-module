locals {
  instance_type = var.instance_type
  instance_name = var.instance_name

  aws_key_filename = (var.aws_key_filename == null)? var.key_filename : var.aws_key_filename
  key_filename = var.key_filename
  private_key_path = pathexpand("~/.ssh/${local.key_filename}.pem")
  public_key_path = pathexpand("~/.ssh/${local.key_filename}.pub")

  automatic_turn_off = var.automatic_turn_off

  temporary_script_location = var.temporary_script_location
  ssh_connect_command = "ssh -i ${local.key_filename}.pem ec2-user@${aws_instance.ec2_instance.public_ip}"
  cd_and_ssh_connect_command = "cd %USER%/.ssh ; ${local.ssh_connect_command}"

  instance_automatic_turn_off_config = var.automatic_turn_off_config

  # no need to use `resource "local_file" "" {...}` (see  https://stackoverflow.com/a/57469070/7069108 )
  on_first_boot_script = templatefile("./on_first_boot_script.tpl", {
    "automatic_turn_off_script_content_in_base64": base64encode(templatefile("./automatic_turn_off_script.sh",
      local.instance_automatic_turn_off_config
    ))
  })
}