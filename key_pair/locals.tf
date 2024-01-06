locals {
  key_filename = var.key_filename
  aws_key_filename = (var.aws_key_filename != null)? var.aws_key_filename : var.key_filename
  private_key_path = pathexpand("~/.ssh/${local.key_filename}.pem")
  public_key_path = pathexpand("~/.ssh/${local.key_filename}.pub")
}