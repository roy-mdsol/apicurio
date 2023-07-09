







# resource "aws_iam_role" "eks-iam-role" {
#   name = "roy-apicurio-eks-iam-role"

#   path = "/"

#   assume_role_policy = <<EOF
# {
#  "Version": "2012-10-17",
#  "Statement": [
#   {
#    "Effect": "Allow",
#    "Principal": {
#     "Service": "eks.amazonaws.com"
#    },
#    "Action": "sts:AssumeRole"
#   }
#  ]
# }
# EOF

# }


# resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role    = aws_iam_role.eks-iam-role.name
# }
# resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role    = aws_iam_role.eks-iam-role.name
# }

# resource "aws_eks_cluster" "roy-apicurio-eks" {
#   name = "roy-apicurio-cluster"
#   role_arn = aws_iam_role.eks-iam-role.arn

#   vpc_config {
#     subnet_ids = [var.subnet_id_1, var.subnet_id_2]
#   }

#   depends_on = [
#     aws_iam_role.eks-iam-role,
#   ]
# }

# resource "aws_iam_role" "workernodes" {
#   name = "eks-node-group-example"

#   assume_role_policy = jsonencode({
#    Statement = [{
#     Action = "sts:AssumeRole"
#     Effect = "Allow"
#     Principal = {
#      Service = "ec2.amazonaws.com"
#     }
#    }]
#    Version = "2012-10-17"
#   })
#  }

#  resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role    = aws_iam_role.workernodes.name
#  }

#  resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role    = aws_iam_role.workernodes.name
#  }

#  resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
#   policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
#   role    = aws_iam_role.workernodes.name
#  }

#  resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role    = aws_iam_role.workernodes.name
#  }

# resource "aws_eks_node_group" "worker-node-group" {
#   cluster_name  = aws_eks_cluster.devopsthehardway-eks.name
#   node_group_name = "devopsthehardway-workernodes"
#   node_role_arn  = aws_iam_role.workernodes.arn
#   subnet_ids   = [var.subnet_id_1, var.subnet_id_2]
#   instance_types = ["t3.xlarge"]

#   scaling_config {
#    desired_size = 1
#    max_size   = 1
#    min_size   = 1
#   }

#   depends_on = [
#    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#    #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#   ]
#  }






# // Define other required resources such as subnets, security groups, etc.

# module "eks_cluster" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "17.0.0"

#   cluster_name       = "roy-aicurio-eks-cluster"
#   cluster_version    = "1.21"
#   vpc_id             = aws_vpc.example.id
#   subnets            = [aws_subnet.example1.id, aws_subnet.example2.id]
#   worker_groups      = []  // Define worker groups if needed
#   manage_aws_auth    = false
#   write_kubeconfig   = true
# }


# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "3.19.0"

#   name = "education-vpc"

#   cidr = "10.0.0.0/16"
#   azs  = slice(data.aws_availability_zones.available.names, 0, 3)

#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

#   enable_nat_gateway   = true
#   single_nat_gateway   = true
#   enable_dns_hostnames = true

#   public_subnet_tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                      = 1
#   }

#   private_subnet_tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#     "kubernetes.io/role/internal-elb"             = 1
#   }
# }