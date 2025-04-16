resource "aws_subnet" "devops_private_subnets" {
  # name = "Devops private subnet"
  vpc_id            = aws_vpc.devops_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "Devops private subnets"
  }
}

resource "aws_subnet" "devops_public_subnets" {
  # name = "Devops private subnet"
  vpc_id                  = aws_vpc.devops_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Devops public subnets"
  }
}