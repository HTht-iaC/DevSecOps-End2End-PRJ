data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state-7t7t"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_eks_cluster" "eks-clusterr" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = concat(
      data.terraform_remote_state.network.outputs.public_subnet_ids,
      data.terraform_remote_state.network.outputs.private_subnet_ids
    )
    endpoint_public_access = true
  }
}

resource "aws_eks_node_group" "eks-clusterrr" {
  cluster_name    = aws_eks_cluster.eks-clusterr.name
  node_group_name = "${var.cluster-name}-ng"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = data.terraform_remote_state.network.outputs.private_subnet_ids

  scaling_config {
    desired_size = 4
    max_size     = 6
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}
