resource "aws_subnet" "eks_private_subnet" {
  # name = "Private subnets"
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "12.0.2.0/24"
  availability_zone = var.region

  tags = {
    Name = "Vpc Private Subnet"
  }
}
resource "aws_subnet" "eks_public_subnet" {
  # name = "Private subnets"
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "12.0.1.0/24"
  availability_zone       = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "Vpc Public Subnet"
  }
}

resource "aws_route_table" "eks_private_subnet_rtb" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route_table" "eks_public_subnet_rtb" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route_table_association" "eks_private_subnet" {
  subnet_id      = aws_subnet.eks_private_subnet.id
  route_table_id = aws_route_table.eks_private_subnet_rtb.id
}

resource "aws_route_table_association" "eks_public_subnet" {
  subnet_id      = aws_subnet.eks_public_subnet.id
  route_table_id = aws_route_table.eks_public_subnet_rtb.id
}
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.eks_public_subnet_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eks_igw.id
}