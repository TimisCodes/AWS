resource "aws_instance" "devops" {

    ami = var.amiID[var.region] 
    instance_type = "t2.micro"
    availability_zone = var.zone1
    key_name = "devops-key"
    subnet_id     = aws_subnet.devops_public_subnets.id
    vpc_security_group_ids = [aws_security_group.devops-sg.id]

    tags = {
        Name = "DevOps-Instance"
    }
}

