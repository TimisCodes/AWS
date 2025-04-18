resource "aws_route_table" "devops_private_rtb" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table" "devops_public_rtb" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.devops_public_subnets.id
  route_table_id = aws_route_table.devops_public_rtb.id

}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.devops_private_subnets.id
  route_table_id = aws_route_table.devops_private_rtb.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.devops_public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops_igw.id
}

