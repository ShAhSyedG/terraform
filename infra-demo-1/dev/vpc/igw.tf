resource "aws_internet_gateway" "codecirrus_dev_igw" {
  vpc_id = aws_vpc.codecirrus_dev.id

  tags = {
    Name        = "codecirrus-dev-igw"
    Environment = "dev"
  }
  depends_on = [ aws_vpc.codecirrus_dev, aws_subnet.public_subnet_1, aws_subnet.public_subnet_2 ]
}