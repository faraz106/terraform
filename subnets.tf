resource "aws_subnet" "private-us-west-1a" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone              = "us-west-1a"

  tags = {
    Name                        = "private-us-west-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks-cluster" = "owned"
  }
}


resource "aws_subnet" "private-us-west-1c" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone              = "us-west-1c"

  tags = {
    Name                        = "private-us-west-1c"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks-cluster" = "owned"
  }
}


resource "aws_subnet" "public-us-west-1a" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.101.0/24"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-us-west-1a"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/eks-cluster" = "owned"
  }
}



resource "aws_subnet" "public-us-west-1c" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.102.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-us-west-1c"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/eks-cluster" = "owned"
  }
}