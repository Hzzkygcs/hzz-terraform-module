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

resource "aws_default_vpc" "default_vpc" {}

module "security_group" {
  source = "./security_group"
  vpc_id = local.vpc_id
}

resource "aws_instance" "ec2_instance" {
  ami = data.aws_ami.linux_aws_machine_image.id
  instance_type = local.instance_type
  key_name = aws_key_pair.aws_ec2_keypair.key_name
  vpc_security_group_ids = local.security_group_ids

  # get log using `sudo cat /var/log/cloud-init-output.log`
  user_data = local.automatic_turn_off? local.on_first_boot_script : ""

  tags = {
    "Name": local.instance_name
  }
}
