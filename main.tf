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
  region = var.region
}

module "vpc" {
  source = "./vpc"
  region = var.region
  cidr_block = var.cidr_block
  vpc_name = var.vpc_name
  instance_tenancy = var.instance_tenancy
  private_az-1_cidr = var.private_az-1_cidr
  private_az-2_cidr = var.private_az-2_cidr
  private_az-3_cidr = var.private_az-3_cidr
  private_az-4_cidr = var.private_az-4_cidr
  private_az-5_cidr = var.private_az-5_cidr
  private_az-6_cidr = var.private_az-6_cidr

  public_az-1_cidr = var.public_az-1_cidr
  public_az-2_cidr = var.public_az-2_cidr
  public_az-3_cidr = var.public_az-3_cidr
  public_az-4_cidr = var.public_az-4_cidr
  public_az-5_cidr = var.public_az-5_cidr
  public_az-6_cidr = var.public_az-6_cidr
}

