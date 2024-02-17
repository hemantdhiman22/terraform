variable "region" {
  default = "ap-south-1"
}

variable "project_name" {
  type = string
}

variable "cidr_block" {
  type = string
}

//Private subnet cidr
variable "private_subnet_cidr" {
  type = list(string)
}

//Public subnet cidr
variable "public_subnet_cidr" {
  type = list(string)
}


/*
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
*/
