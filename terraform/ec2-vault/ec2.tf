data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state-7t7t"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "vault_server" {
  ami                    = "ami-0532be01f26a3de55"
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.vaultt_key.key_name
  vpc_security_group_ids = [aws_security_group.vault_sg.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  user_data              = base64encode(templatefile("${path.module}/install-vault.sh", {}))

  tags = {
    Name = "HashiCorp-Vault-Server"
  }
}
