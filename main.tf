provider "aws" {
  region = "us-east-1"
  access_key = "(secret)"
  secret_key = "(secret)"
}

resource "aws_instance" "ubuntu" {
  ami  = "ami-0b0ea68c435eb488d"
  instance_type  = "t2.micro"
  tags = {
    Name = "terraform_ec2"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform_vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "terraform_subnet"
  }
  vpc_id = aws_vpc.main.id
}