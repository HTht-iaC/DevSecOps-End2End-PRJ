resource "aws_iam_role" "gitlab_runner_role" {
  name = "gitlab-runner-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "runner_ecr_full" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.gitlab_runner_role.name
}

resource "aws_iam_role_policy_attachment" "runner_eks_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.gitlab_runner_role.name
}

resource "aws_iam_instance_profile" "runner_profile" {
  name = "gitlab-runner-instance-profile"
  role = aws_iam_role.gitlab_runner_role.name
}
