resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "nat-eip"
    Environment = "dev"
    ManagedBy   = "iac-agent"
    Owner       = "furqan"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name        = "main-nat-gateway"
    Environment = "dev"
    ManagedBy   = "iac-agent"
    Owner       = "furqan"
  }

  depends_on = [aws_internet_gateway.main]
}
