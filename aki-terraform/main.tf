terraform {
  required_version = "~> 1.3.6" # which means >= 1.3 and < 1.4
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
  #you don't need them if you have already configured your aws account
#   access_key = ""
#   secret_key = ""
}

# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-074dc0a6f6c764218" # Amazon Linux
  instance_type = "t2.micro"
  count         = 2
  key_name      = "akhabya"
  tags = {
    "Name" = "Anirudh"
  }
}