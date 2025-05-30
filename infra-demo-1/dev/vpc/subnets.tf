resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.codecirrus_dev.id
    cidr_block = "172.16.10.0/24"
    availability_zone = "us-east-1a"

    tags = {
      "Name" = "codecirrus-dev-private-subnet-1"
      "kubernetes.io/role/internal-elb" = "1"
      "kubernetes.io/cluster/codecirrus-dev" = "owned"
    }
    depends_on = [ aws_vpc.codecirrus_dev ]
}
resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.codecirrus_dev.id
    cidr_block = "172.16.11.0/24"
    availability_zone = "us-east-1b"
    tags = {
      "Name" = "codecirrus-dev-private-subnet-2"
      "kubernetes.io/role/internal-elb" = "1"
      "kubernetes.io/cluster/codecirrus-dev" = "owned"
    }
    depends_on = [ aws_vpc.codecirrus_dev ]
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.codecirrus_dev.id
  cidr_block = "172.16.100.0/27"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "codecirrus-dev-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/codecirrus-dev" = "owned"
  }
  depends_on = [ aws_vpc.codecirrus_dev ]
  
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.codecirrus_dev.id
  cidr_block = "172.16.101.0/27"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "codecirrus-dev-public-subnet-2"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/codecirrus-dev" = "owned"
  }
  depends_on = [ aws_vpc.codecirrus_dev ]
}