provider "aws" {    
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
resource "aws_subnet" "private" { 
  vpc_id     = aws_vpc.my_vpc.id
  for_each   = toset(["us-east-1a", "us-east-1b", "us-east-1c"])
  cidr_block = element(var.subnet_cidr_blocks, each.key)
  availability_zone = each.value

  tags = {
    Name = "private_subnet_${each.key}"
  }
}