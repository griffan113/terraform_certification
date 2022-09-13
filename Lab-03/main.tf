provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "vpc" {}

resource "aws_instance" "Ubuntu" {
  ami = "ami-08ae71fd7f1449df1"
  instance_type = "t1.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = file("user_data.sh")

  tags = {
    Name = "Ubuntu Server"
  }
}

resource "aws_security_group" "sg" {
  name = "UbuntuServer-SG"
  vpc_id = aws_default_vpc.vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
