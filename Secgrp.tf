resource "aws_security_group" "devops-sg" {
  name        = "devops-sg"
  description = "Allow Inbound traffic and Outbound all traffic"
  vpc_id      = aws_vpc.devops_vpc.id
  tags = {
    Name = "devops-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfrommyip" {
  security_group_id = aws_security_group.devops-sg.id
  cidr_ipv4         = "102.89.32.148/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "sshfromhttp" {
  security_group_id = aws_security_group.devops-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_allOutbound_ipv4" {
  security_group_id = aws_security_group.devops-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_allOutbound_ipv6" {
  security_group_id = aws_security_group.devops-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}


