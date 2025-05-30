provider "aws" {
  region = "us-east-1"

  profile = "codecirrus_dev"
}

terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-codecirrus"
    key            = "infra-demo-1/dev/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "codecirrus-terraform-locks"
  }
}