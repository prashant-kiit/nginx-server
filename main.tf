provider "aws" {
  region = "us-east-1"  # Change if needed
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (for us-east-1)
  instance_type = "t2.micro"              # Free-tier eligible

  tags = {
    Name = "MyEC2Instance"
  }
}