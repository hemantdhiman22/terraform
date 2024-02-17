variable "region" {
  default = "ap-south-1"
}
variable "cidr_block" {
  default = "10.10.0.0/16"
}
variable "vpc_name" {
  default = "Prod_vpc"
}
variable "instance_tenancy" {
  default = "default"
}

//Private subnet cidr
variable "private_az-1_cidr" {
  default = "10.10.0.0/24"
}
variable "private_az-2_cidr" {
  default = "10.10.1.0/24"
}
variable "private_az-3_cidr" {
  default = "10.10.2.0/24"
}
variable "private_az-4_cidr" {
  default = "10.10.3.0/24"
}
variable "private_az-5_cidr" {
  default = "10.10.4.0/24"
}
variable "private_az-6_cidr" {
  default = "10.10.5.0/24"
}

//Public subnet cidr
variable "public_az-1_cidr" {
  default = "10.10.6.0/24"
}
variable "public_az-2_cidr" {
  default = "10.10.7.0/24"
}
variable "public_az-3_cidr" {
  default = "10.10.8.0/24"
}
variable "public_az-4_cidr" {
  default = "10.10.9.0/24"
}
variable "public_az-5_cidr" {
  default = "10.10.10.0/24"
}
variable "public_az-6_cidr" {
  default = "10.10.11.0/24"
}
variable "eip_name" {
  default = "Prod_NAT_eip"
}