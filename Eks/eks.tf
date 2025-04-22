
module "eks" {

    source = "terraform-aws-modules/eks/aws"
    version = "~> 20.31"
    cluster_name = "eks-cluster"
    cluster_version = "1.32"
    subnet_ids = [aws_subnet.eks_private_subnet.id, aws_subnet.eks_public_subnet.id]
 
    vpc_id = aws_vpc.eks_vpc.id 

    eks_managed_node_groups = {
        eks_nodes = {
            desired_capacity = 2
            max_capacity = 3
            min_capacity = 1
            instance_type = "t3.medium"
        }

    }
    tags = {
        Name = "eks-cluster"
    }


}