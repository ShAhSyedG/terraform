resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "main-igw"
    Environment = "dev"
    ManagedBy   = "iac-agent"
    Owner       = "furqan"
  }
}
