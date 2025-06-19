resource "aws_iam_role" "cluster_role" {
  name = "private-eks-cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_role-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}



resource "aws_eks_cluster" "private-eks" {
  name     = "private-eks"
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    
    subnet_ids = [
      aws_subnet.private-us-west-1a.id,
      aws_subnet.private-us-west-1c.id,
      aws_subnet.public-us-west-1a.id,
      aws_subnet.public-us-west-1c.id,
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_role-AmazonEKSClusterPolicy]
}


