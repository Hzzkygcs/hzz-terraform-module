resource "tls_private_key" "private_key"{
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "aws_ec2_keypair" {
  key_name = local.aws_key_filename
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "local_sensitive_file" "private_key_file" {
  filename = local.private_key_path
  content = tls_private_key.private_key.private_key_openssh
}

resource "local_file" "public_key_file" {
  filename = local.public_key_path
  content = tls_private_key.private_key.public_key_openssh
}