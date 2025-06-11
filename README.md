# WordPress Deployment on AWS with Terraform and Vault

This project provisions a basic, production-style WordPress environment on AWS using Terraform. It also integrates HashiCorp Vault to securely manage sensitive information such as database credentials.

## Project Overview

The goal is to demonstrate core Infrastructure as Code (IaC) principles using Terraform, while applying secure secret management practices with Vault. The setup includes:

- A custom VPC with public subnets
- An EC2 instance hosting WordPress (Apache, PHP, MySQL)
- A Vault EC2 instance used to store and retrieve secrets
- A public domain (via Route 53) pointing to the WordPress server
- Secrets (DB credentials, admin passwords) handled exclusively via Vault


## Vault Usage

Vault is deployed on a separate EC2 instance and is used to store secrets such as:

- WordPress DB credentials
- Admin login credentials

Secrets are injected into the WordPress EC2 setup using Vault CLI or templated `user_data` scripts.

## Project Structure

```plaintext
.
├── .terraform/                         # Terraform working directory (auto-generated)
├── modules/
│   ├── vault/
│   │   ├── install_vault.sh           # Vault init/setup script
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── wordpress/
│       ├── install_wordpress.sh       # WordPress EC2 bootstrap script
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── .gitignore
├── .terraform.lock.hcl
├── main.tf                            # Root module wiring all components together
├── output.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars                   # Input values (not committed)
├── terraform.tfstate                  # Local state file (not committed)
├── terraform.tfstate.backup          # Backup of state (not committed)
└── README.md


