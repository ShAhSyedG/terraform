resource "aws_eip" "dev_nat_eip" {
  tags = {
    Name        = "codecirrus-dev-nat-eip"
    Environment = "dev"
  }
  
}

resource "aws_nat_gateway" "codecirrus_dev_nat" {
  allocation_id = aws_eip.dev_nat_eip.id
  subnet_id = aws_subnet.public_subnet_1.id
  #connectivity_type = public
    tags = {
        Name        = "codecirrus-dev-nat-gateway"
        Environment = "dev"
    }
    depends_on = [ aws_internet_gateway.codecirrus_dev_igw, aws_subnet.public_subnet_1 ]
}