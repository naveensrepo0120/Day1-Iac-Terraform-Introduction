terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "ap_south_1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_instance" "my_ec2_apsouth" {
  provider = aws.ap_south_1
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2ISTANCE-APSOUTH"
  }
}

resource "aws_instance" "my_ec2_useast" {
  provider = aws.us_east_1
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2INSTANCE-EASTUS"
  }
}
