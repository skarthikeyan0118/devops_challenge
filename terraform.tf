provider "aws" { 
	region     = var.aws_region
        access_key = var.aws_access_key
        secret_key = var.aws_secret_key
} 

resource "aws_key_pair" "gsy_deployer" {
  key_name   = "gsy_deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzg2d5g6424emj7LRk2oRpldSn/WhW0aFAtm18qFNV35ss+G6Vjvnmp+5qS78g8fioCUfxeTwuVz54xHSfaiEUINJG/lIKAcIrYe5FabEXc6BOR6ROhgA1ggSiofdxtrL0VGnQSPGuiK5niRY6iyOsdzTmSRBe1+8HiWEdxlFI/7jgnu/EabAt9PjRoTdAgPG+SQt/b2VYeYVtGX/QCwhvTq7h7ek7sYp/m8pYvNYbcAwkiZ5h8qEfe1ZZaJ3jZsj1a+iGDlrnSoynZSNmA/5XP6esuQzWVsIiSfYM9CsUBumE7piYY4D2s9oSo/mPilh+nhAMaBbLw1mzPV2SCBe5 karthikeyan@HIMGL70962"
}

resource "aws_instance" "gsy_instance" { 
        ami = "ami-0778803ad9d2ff112" 
        instance_type = "t2.micro"
	key_name = "gsy_deployer-key"
        tags = { 
         Name = "gsy_docker_ec2_instance" 
        } 
}

# create the VPC
resource "aws_vpc" "My_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "My VPC"
}
} # end resource

# Create the Security Group
resource "aws_security_group" "My_VPC_Security_Group" {
  vpc_id       = aws_vpc.My_VPC.id
  name         = "My VPC Security Group"
  description  = "My VPC Security Group"
  
  # allow ingress of port 22
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  } 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
   Name = "My VPC Security Group"
   Description = "My VPC Security Group"
}
} # end resource

