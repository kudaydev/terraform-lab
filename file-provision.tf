provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {

  ami                    = "ami-08e5424edfe926b43"
  instance_type          = "t2.micro"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
provisioner "file" {
  source      = "C:/Users/Bhargav Royal'S/Music/key/test_file.txt"
  destination = "/home/ubuntu/test_file.txt"
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("C:/Users/Bhargav Royal'S/Music/key/aws_key")
  }

  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCOgORBluJHrFPwuXWgbUx4hNF8oF4Q8NJwg8eeYWTa9kumKeoLW9J9a78S8C81FX6JKEQifnLLQ5hfxK4jYN0TLpZYgMS+j6NIpDoP6yAm/v4d1mDnZhwg6jSQN5UxUAnoHNY+rQdZNO1hSzayBtBa1wMrscnz3HwX9CTAjeCtbx/oBP+nViYGvmXuEhgpHzqnkAjnzsWhDsUwJFlo0F05J7d9IlvqBfFHTPa6nuOZIvItg9Mp7fGGj8Oz1+BoKldnjK0AQhJOLon5Hxa1dTafhdsWuHY2xIBiO+QNZfuLJJGQnpr9DrysrtuY9KjlZgS4Ev8ZG2mQd2rK+5TB2LD bhargav royal's@LAPTOP-CHASBC7R"
}
