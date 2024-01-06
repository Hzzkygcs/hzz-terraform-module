output "private_key_path" {
  value = local.private_key_path
}
output "public_key_path" {
  value = local.public_key_path
}
output "aws_key_filename" {
  value = local.aws_key_filename
}
output "key_filename" {
  value = local.key_filename
}
output "aws_ec2_keypair" {
  value = aws_key_pair.aws_ec2_keypair
}
