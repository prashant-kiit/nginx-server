provider "aws" {
  region = "us-east-1"  # Change if needed
}

resource "aws_key_pair" "m4_key" {
  key_name   = "m4-key"
  public_key = file("~/.ssh/id_rsa_aws.pub")
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to all for SSH; tighten for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (for us-east-1)
  instance_type = "t2.micro"              # Free-tier eligible
  key_name      = aws_key_pair.m4_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "NginxServerEC2"
  }
}