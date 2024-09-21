terraform {
    cloud {
        organization = "oce-associates"
        workspaces {
          name = "aws-platform"
        }
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07a0715df72e58928"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }
}
