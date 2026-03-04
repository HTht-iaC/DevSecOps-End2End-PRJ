resource "aws_instance" "gitlab_runner" {
  ami                    = "ami-0532be01f26a3de55"
  instance_type          = "t3.medium"
  key_name = aws_key_pair.runner_key.key_name
  iam_instance_profile   = aws_iam_instance_profile.runner_profile.name
  vpc_security_group_ids = [aws_security_group.runner_sg.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]

  user_data = base64encode(templatefile("${path.module}/install-runner.sh", {}))
  tags = {
    Name = "GitLab-Runner-Server"
  }
}
