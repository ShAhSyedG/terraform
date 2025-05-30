resource "aws_route_table" "private_route_dev" {
    vpc_id = aws_vpc.codecirrus_dev.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.codecirrus_dev_nat.id
    }
    tags = {
        Name = "Pricate Route Table - Dev"
    }
  
}

resource "aws_route_table" "public_route_dev" {
    vpc_id = aws_vpc.codecirrus_dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.codecirrus_dev_igw.id
    }
  
}

resource "aws_route_table_association" "private_us_east_1a" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_dev.id
}

resource "aws_route_table_association" "private_us_east_1b" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_route_dev.id
}

resource "aws_route_table_association" "public_us_east_1a" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_dev.id
}

resource "aws_route_table_association" "public_us_east_1b" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_route_dev.id
}

