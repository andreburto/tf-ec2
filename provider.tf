terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    encrypt = true
    bucket = "mothersect-tf-state"
    dynamodb_table = "mothersect-tf-state-lock"
    key    = "tf-ec2"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = var.aws_region
}