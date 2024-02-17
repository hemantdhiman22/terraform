resource "aws_vpc" "prod" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  
  tags = {
    Name = "${var.project_name}-VPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

//Private subnets

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.prod.id
  count = length(var.private_subnet_cidr)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = element(var.private_subnet_cidr, count.index)
  map_public_ip_on_launch = "false"
  tags = {
    Name = "${var.project_name}-private_subnet-${count.index}"
  }
}

//Public subnets

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.prod.id
  count = length(var.public_subnet_cidr)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = element(var.public_subnet_cidr, count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.project_name}-public_subnet-${count.index}"
  }
}


//Internet Gateway

resource "aws_internet_gateway" "IGW-1" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "${var.project_name}-IGW"
  }
}

//public route-table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.prod.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-1.id
  }
  tags = {
    Name = "${var.project_name}-pulic-route-table"
  }
}

//public route table association

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}

//Private route table

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
}
  tags = {
    Name = "${var.project_name}-private-route-table"
  }
}

//Private route table association

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}


//Elastic IP for NAT

resource "aws_eip" "eip" {
  tags = {
    Name = "${var.project_name}-eip"
  }
}

//NAT Gateway

resource "aws_nat_gateway" "nat" {
  //count = length(aws_subnet.private)
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public[0].id
}
