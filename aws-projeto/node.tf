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
    role = "general"
  }

eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = ["t2.small"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
      disk_size      = 30
      labels = {
        "node" = "node-group-1"
        "app"  = "testing"
      }
      block_device_mappings = {
      sdc = {
        device_name = "/dev/sdc"
        ebs = {
          volume_size           = 50
          volume_type           = "gp2"
          delete_on_termination = false
        }
      }
    }
      disk_size = 30
      pre_bootstrap_user_data = <<-EOT
      echo 'DevOps- Because Developers Need Heroes'
      EOT
    }
    two = {
      name           = "node-group-2"
      instance_types = ["t2.small"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
      disk_size      = 30
      labels = {
        "node" = "node-group-2"
        "app"  = "testing"
      }
      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT
      taints  = [{
        key = "dedicated"
        value  = "testing"
        effect = "NO_SCHEDULE"
      }]
    }
  }

    depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}
