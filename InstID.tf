data "aws_ami" "amiID" {
    most_recent = true

    tags = {
        Name = "ami id"
    }
    
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
    }

    filter { 
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

output "Instance_Id" {
  description = "AMI ID of the Instance ID"
  value = data.aws_ami.amiID.id
}