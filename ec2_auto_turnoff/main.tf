terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ec2_vpc" {
  source = "./vpc"
}

resource "aws_instance" "ec2_instance" {
  ami = data.aws_ami.linux_aws_machine_image.id
  instance_type = local.instance_type
  key_name = aws_key_pair.aws_ec2_keypair.key_name
  security_groups = [
    module.ec2_vpc.aws_security_group.allow_ssh.id,
    module.ec2_vpc.aws_security_group.allow_all_outbound.id,
  ]
  subnet_id = module.ec2_vpc.public_subnet_a.id

  # get log using `sudo cat /var/log/cloud-init-output.log`
  user_data = local.automatic_turn_off? local.on_first_boot_script : ""

  tags = {
    "Name": local.instance_name
  }
}
