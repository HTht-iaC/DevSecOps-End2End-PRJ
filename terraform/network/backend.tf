terraform {
  backend "s3" {
    bucket         = "my-terraform-state-7t7t"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}
