# End-to-End DevSecOps Project on AWS

![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![GitLab CI](https://img.shields.io/badge/GitLab_CI-FC6D26?style=for-the-badge&logo=gitlab&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)
![Vault](https://img.shields.io/badge/Vault-FFEC6E?style=for-the-badge&logo=vault&logoColor=black)
![SonarCloud](https://img.shields.io/badge/SonarCloud-F3702A?style=for-the-badge&logo=sonarcloud&logoColor=white)
![Trivy](https://img.shields.io/badge/Trivy-1904DA?style=for-the-badge&logo=aquasecurity&logoColor=white)
![OWASP](https://img.shields.io/badge/OWASP-000000?style=for-the-badge&logo=owasp&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?style=for-the-badge&logo=helm&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

## Architecture

<img width="1314" height="568" alt="Screenshot (380)" src="https://github.com/user-attachments/assets/f5548f8d-c800-464e-b1be-8e4037a5172b" />
Modern software delivery demands speed without sacrificing security. This project bridges that gap by building a fully automated, security-first deployment pipeline on AWS. Every component — from network configuration to container runtime — is version-controlled, auditable, and reproducible. Whether you're provisioning infrastructure, scanning code for vulnerabilities, or deploying to Kubernetes, this project provides a battle-tested reference for implementing DevSecOps practices in a real-world environment.


## Overview

This project delivers a production-grade DevSecOps pipeline on AWS, automating everything from infrastructure provisioning to application deployment with security embedded at every stage. Using Terraform, the entire AWS infrastructure — including VPC, EKS, ECR, and EC2 instances — is provisioned as code, with dedicated GitLab CI/CD pipelines for each Terraform module enabling automated validation, planning, and apply/destroy operations triggered only when the relevant infrastructure code changes. Infrastructure variables such as VPC configurations and cluster settings are stored securely in HashiCorp Vault and fetched dynamically during pipeline execution via AppRole authentication. Application code is pushed to GitHub, mirrored to GitLab via GitHub Actions, and processed through a multi-stage CI/CD pipeline that includes static code analysis with SonarCloud, filesystem and image scanning with Trivy, and dependency checks with OWASP. Built Docker images are pushed to ECR, and Kubernetes manifests are automatically updated and synced to the EKS cluster via ArgoCD. Application secrets such as database credentials are managed centrally through HashiCorp Vault, with credentials injected securely into pods using the Vault Agent Sidecar. The running application is monitored in real time using Prometheus and Grafana.

## Project Structure
<img width="287" height="813" alt="Screenshot (381)" src="https://github.com/user-attachments/assets/2ac377ed-482c-42ff-9cd6-860e4a52e388" />

## Infrastructure Provisioning Pipeline
<img width="1138" height="441" alt="Screenshot (311)" src="https://github.com/user-attachments/assets/172c24ac-0970-45d1-943d-b5dc827f95dc" />

## Application CI/CD Pipeline
<img width="852" height="75" alt="Screenshot (351)" src="https://github.com/user-attachments/assets/5aadd064-ce71-44af-92ba-83ab25d12829" />

## GitOps Workflow & Application Sync


<img width="1512" height="737" alt="Screenshot (357)" src="https://github.com/user-attachments/assets/14fbb603-f908-4fc8-95e2-0cec7ab375f8" />

## Conclusion

This project demonstrates how modern DevSecOps practices can be applied end-to-end on AWS, combining infrastructure automation, security scanning, secrets management, and GitOps-based deployments into a single cohesive pipeline.
By treating infrastructure as code with Terraform, every AWS resource is reproducible, version-controlled, and auditable. Integrating security tools such as SonarCloud, Trivy, and OWASP directly into the CI/CD pipeline ensures that vulnerabilities are caught early in the development lifecycle rather than after deployment. Centralizing secrets in HashiCorp Vault and using AppRole authentication for pipelines and the Vault Agent Sidecar for pods eliminates hardcoded credentials entirely across both infrastructure and application layers.
The GitOps approach with ArgoCD ensures that the cluster state always reflects what is defined in the repository, making deployments consistent, traceable, and easy to roll back. Combined with real-time monitoring through Prometheus and Grafana, the system provides full visibility into the health and performance of the running application.
The result is a fully automated, security-first deployment pipeline that reflects real-world production standards and best practices in cloud-native application delivery.
