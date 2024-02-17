resource "aws_vpc" "prod" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  
  tags = {
    Name = var.vpc_name
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

//Private subntes
resource "aws_subnet" "private_az-1" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = var.private_az-1_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-1"
  }
}

resource "aws_subnet" "private_az-2" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block = var.private_az-2_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-2"
  }
}

resource "aws_subnet" "private_az-3" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block = var.private_az-3_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-3"
  }
}

resource "aws_subnet" "private_az-4" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[3]
  cidr_block = var.private_az-4_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-4"
  }
}

resource "aws_subnet" "private_az-5" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[4]
  cidr_block = var.private_az-5_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-5"
  }
}

resource "aws_subnet" "private_az-6" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[5]
  cidr_block = var.private_az-6_cidr
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private_az-6"
  }
}

//Public subnets 
resource "aws_subnet" "public_az-1" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = var.public_az-1_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-1"
  }
}

resource "aws_subnet" "public_az-2" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block = var.public_az-2_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-2"
  }
}

resource "aws_subnet" "public_az-3" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block = var.public_az-3_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-3"
  }
}

resource "aws_subnet" "public_az-4" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[3]
  cidr_block = var.public_az-4_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-4"
  }
}

resource "aws_subnet" "public_az-5" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[4]
  cidr_block = var.public_az-5_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-5"
  }
}

resource "aws_subnet" "public_az-6" {
  vpc_id = aws_vpc.prod.id
  availability_zone = data.aws_availability_zones.available.names[5]
  cidr_block = var.public_az-6_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_az-6"
  }
}

//Internet Gateway
resource "aws_internet_gateway" "IGW-1" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "Prod-IGW-1"
  }
}

//public route-table
resource "aws_route_table" "Prod_Public_Route_table" {
  vpc_id = aws_vpc.prod.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-1.id
  }
  tags = {
    Name = "Prod_Public_Route_table"
  }
}

resource "aws_route_table_association" "public_subnet_az1-assoc" {
  subnet_id = aws_subnet.public_az-1.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}
resource "aws_route_table_association" "public_subnet_az2-assoc" {
  subnet_id = aws_subnet.public_az-2.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}
resource "aws_route_table_association" "public_subnet_az3-assoc" {
  subnet_id = aws_subnet.public_az-3.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}
resource "aws_route_table_association" "public_subnet_az4-assoc" {
  subnet_id = aws_subnet.public_az-4.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}
resource "aws_route_table_association" "public_subnet_az5-assoc" {
  subnet_id = aws_subnet.public_az-5.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}
resource "aws_route_table_association" "public_subnet_az6-assoc" {
  subnet_id = aws_subnet.public_az-6.id
  route_table_id = aws_route_table.Prod_Public_Route_table.id
}


//Elastic IP for NAT
resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_name
  }
}

//NAT Gateway
resource "aws_nat_gateway" "Prod_NAT-1" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_az-1.id
}

//Private route table
resource "aws_route_table" "Prod_Private_Route_table" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Prod_NAT-1.id
}
}

resource "aws_route_table_association" "private_subnet_az1-assoc" {
  subnet_id = aws_subnet.private_az-1.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}
resource "aws_route_table_association" "private_subnet_az2-assoc" {
  subnet_id = aws_subnet.private_az-2.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}
resource "aws_route_table_association" "private_subnet_az3-assoc" {
  subnet_id = aws_subnet.private_az-3.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}
resource "aws_route_table_association" "private_subnet_az4-assoc" {
  subnet_id = aws_subnet.private_az-4.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}
resource "aws_route_table_association" "private_subnet_az5-assoc" {
  subnet_id = aws_subnet.private_az-5.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}
resource "aws_route_table_association" "private_subnet_az6-assoc" {
  subnet_id = aws_subnet.private_az-6.id
  route_table_id = aws_route_table.Prod_Private_Route_table.id
}


