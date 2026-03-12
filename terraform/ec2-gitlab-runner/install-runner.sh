#!/bin/bash
dnf update -y
dnf install -y docker aws-cli
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash
dnf install -y gitlab-runner
usermod -aG docker gitlab-runner
systemctl enable gitlab-runner
systemctl start gitlab-runner
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum install -y terraform vault
yum install -y jq
wget https://github.com/aquasecurity/trivy/releases/download/v0.45.0/trivy_0.45.0_Linux-64bit.rpm
rpm -ivh trivy_0.45.0_Linux-64bit.rpm
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
unzip sonar-scanner-cli-5.0.1.3006-linux.zip
mv sonar-scanner-5.0.1.3006-linux /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' > /etc/profile.d/sonar.sh
chmod +x /etc/profile.d/sonar.sh
