provider "aws" {    
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
resource "aws_subnet" "subnet_3" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.10.3.0/24"
  tags = {
    Name = "subnet_3"
  }
}

resource "aws_subnet" "subnet_4" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.10.4.0/24"
  tags = {
    Name = "subnet_4"
  }
}
