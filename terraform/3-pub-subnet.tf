# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "roy_pub_sn_1" {
  vpc_id     = aws_vpc.roy_apicurio_vpc.id
  cidr_block = "192.168.0.0/18"

    #   Multi AZ as per AWS best practice
    availability_zone = "us-east-1a"

    # required by EKS
    map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/cluster/elb" = 1
    Project = "apicurio"
    Owner   = "roy"

  }
}

resource "aws_subnet" "roy_pub_sn_2" {
  vpc_id     = aws_vpc.roy_apicurio_vpc.id
  cidr_block = "192.168.32.0/18"

    #   Multi AZ as per AWS best practice
    availability_zone = "us-east-1b"

    # required by EKS
    map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/cluster/elb" = 1
    Project = "apicurio"
    Owner   = "roy"

  }
}

resource "aws_subnet" "roy_priv_sn_1" {
  vpc_id     = aws_vpc.roy_apicurio_vpc.id
  cidr_block = "192.168.64.0/18"

    #   Multi AZ as per AWS best practice
    availability_zone = "us-east-1a"

    # required by EKS
    map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/cluster/elb" = 1
    Project = "apicurio"
    Owner   = "roy"

  }
}
resource "aws_subnet" "roy_priv_sn_2" {
  vpc_id     = aws_vpc.roy_apicurio_vpc.id
  cidr_block = "192.168.128.0/18"

    #   Multi AZ as per AWS best practice
    availability_zone = "us-east-1b"

    # required by EKS
    map_public_ip_on_launch = true

  tags = {
    Name    = "private-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/cluster/elb" = 1
    Project = "apicurio"
    Owner   = "roy"

  }
}