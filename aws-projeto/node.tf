resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.demo.name
  node_group_name = "public-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = [
    aws_subnet.subnet_public_1b.id,
    aws_subnet.subnet_public_1a.id
  ]

  ami_type  = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.large"]
  disk_size      = "50"

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
        "node" = "Node*Master"
        "app"  = "devopsElite"
      }

    depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}
