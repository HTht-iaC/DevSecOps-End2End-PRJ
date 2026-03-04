resource "aws_key_pair" "runner_key" {
  key_name   = "gitlab-runner-key"
  public_key = file("runner_key.pub")
}
