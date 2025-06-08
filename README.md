# WordPress Deployment on AWS with Terraform and Vault

This project provisions a basic, production-style WordPress environment on AWS using Terraform. It also integrates HashiCorp Vault to securely manage sensitive information such as database credentials.

## 🧱 Project Overview

The goal is to demonstrate core Infrastructure as Code (IaC) principles using Terraform, while applying secure secret management practices with Vault. The setup includes:

- A custom VPC with public subnets
- An EC2 instance hosting WordPress (Apache, PHP, MySQL)
- A Vault EC2 instance used to store and retrieve secrets
- A public domain (via Route 53) pointing to the WordPress server
- Secrets (DB credentials, admin passwords) handled exclusively via Vault

## 🗂️ Project Structure

| File/Module         | Description                                      |
|---------------------|--------------------------------------------------|
| `provider.tf`       | AWS provider configuration                      |
| `vpc/`              | Terraform module for VPC, subnets, gateways     |
| `wordpress/`        | Terraform module for the EC2 WordPress instance |
| `vault/`            | Terraform module for the Vault instance         |
| `variables.tf`      | Input variables for configuration               |
| `outputs.tf`        | Useful output values (IP, domain, etc.)         |
| `main.tf`           | Root configuration that ties all modules        |

## 🔐 Vault Usage

Vault is deployed on a separate EC2 instance and is used to store secrets such as:

- WordPress DB credentials
- Admin login credentials

Secrets are injected into the WordPress EC2 setup using Vault CLI or templated `user_data` scripts.