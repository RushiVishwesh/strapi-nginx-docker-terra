provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARENAGCMW6XT2FDGR"
  secret_key = "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
"
}

resource "aws_security_group" "Project_sg" {
  name = "Project_sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Project" {
  ami             = "ami-0ecb62995f68bb549"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.Project_sg.name]

  # Use your already-created key pair
  key_name        = "strapi"

  count           = 1
}


