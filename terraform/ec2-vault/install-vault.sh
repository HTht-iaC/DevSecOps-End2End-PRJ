#!/bin/bash
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo dnf install -y vault
sudo systemctl enable vault
sudo systemctl start vault
export VAULT_ADDR='http://127.0.0.1:8200'
