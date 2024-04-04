provider "aws" {    
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
data "aws_availability_zones" "available" {}
resource "aws_subnet" "private_subnet" {
  count             = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.subnet_cidr_blocks, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "private_subnet_${count.index}"
  }
}

# Create additional subnets if all availability zones are assigned
locals {
  assigned_azs = [for subnet in aws_subnet.private_subnet : subnet.availability_zone]
  remaining_azs = setsubtract(data.aws_availability_zones.available.names, local.assigned_azs)
}

resource "aws_subnet" "private_subnet_additional" {
  count             = length(local.remaining_azs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.subnet_cidr_blocks, count.index + length(data.aws_availability_zones.available.names))
  availability_zone = element(local.remaining_azs, count.index)
  tags = {
    Name = "private_subnet_additional_${count.index}"
  }
}
