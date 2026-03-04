terraform {
  backend "s3" {
    bucket         = "my-terraform-state-7t7t"
    key            = "ec2-gitlab-runner/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}

