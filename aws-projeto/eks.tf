resource "aws_eks_cluster" "demo" {
  name     = "devopselite"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_public_1a.id,
      aws_subnet.subnet_public_1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}