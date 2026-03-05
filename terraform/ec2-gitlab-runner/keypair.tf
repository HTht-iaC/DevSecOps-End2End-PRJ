resource "aws_key_pair" "runner_key" {
  key_name   = "gitlab-runner-ec2-key"
  public_key = file("runner_key.pub")
}
