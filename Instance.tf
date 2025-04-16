resource "aws_instance" "devops" {

    ami = data.aws_ami.amiID.id 
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = "devops-key"
    subnet_id     = aws_subnet.devops_public_subnets.id
    vpc_security_group_ids = [aws_security_group.devops-sg.id]

    tags = {
        Name = "DevOps-Instance"
    }
}

