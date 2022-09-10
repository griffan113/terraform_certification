provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t1.micro"
  key_name = "griffan-keys"

  tags = {
    Name = "Ubuntu Server"
  }
}