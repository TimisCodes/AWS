resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "Devops_igw"
  }
}