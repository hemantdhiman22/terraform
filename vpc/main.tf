terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.36.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}


module "vpc" {
  source = "./vpc"
  project_name = var.project_name
  cidr_block = var.cidr_block
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
}