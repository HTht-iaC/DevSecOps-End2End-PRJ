resource "aws_key_pair" "vaultt_key" {
  key_name   = "gitlab-runner-key"
  public_key = file("vault_key.pub")
}

