resource "aws_vpc" "ec2_vpc" {
  cidr_block = "172.16.37.0/24"  # random sesuai keingininan. Best practicenya tidak overlap dengan vcp lain

  enable_dns_hostnames = true

  tags = {
    "Name": "demo-ec2-vpc"
  }
}