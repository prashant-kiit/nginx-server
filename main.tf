provider "aws" {
  region = "us-east-1"  # Change if needed
}

variable "ssh_local_path" {
  description = "SSH Local Path"
  type        = string
}

resource "aws_key_pair" "m4_key" {
  key_name   = "m4-key"
  public_key = file(var.ssh_local_path)
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Nginx access on port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my_ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Amazon Linux 2 (for us-east-1)
  instance_type = "t2.micro"              # Free-tier eligible
  key_name      = aws_key_pair.m4_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "NginxServerEC2"
  }
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}