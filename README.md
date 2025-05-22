# Deploy WordPress on AWS using Terraform and Vault

This project provisions a production-like WordPress environment on AWS using Terraform. The infrastructure includes a custom VPC, EC2 instances, and HashiCorp Vault for secure secret management. All infrastructure components are fully automated through code.

---

## Architecture Overview

- **VPC** with public and (optional) private subnets
- **EC2 instance** hosting WordPress (Apache, PHP, MySQL or RDS backend)
- **Vault EC2 instance** used to store and retrieve secrets securely
- **Route 53** domain pointing to WordPress application
- **Secrets Management** handled via Vault (e.g., DB credentials, admin passwords)

Optional (bonus) components include:
- Auto Scaling Group (ASG) for WordPress
- Packer-built AMIs
- CI/CD pipeline for infrastructure deployment

---

## Components

| Component     | Description                                  |
|---------------|----------------------------------------------|
| `provider.tf` | AWS provider setup                           |
| `vpc.tf`      | Custom VPC, subnets, route tables, gateways  |
| `wordpress.tf`| EC2 instance + user_data for WordPress setup |
| `vault.tf`    | Vault instance setup + initialization script |
| `variables.tf`| Input variables                              |
| `outputs.tf`  | Public IPs, domain name outputs              |

---

## Usage

Ensure your AWS CLI is configured with appropriate IAM permissions:

```bash
aws configure
