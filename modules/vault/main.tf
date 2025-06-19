# Launch Vault EC2 instance
# Bootstrap Vault (manual or scripted)
# Add a test secret like DB credentials for WordPress to retrieves

# In real-world production setups, Vault is always deployed separately from applications for both security and reliability.

resource "aws_instance" "vault" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = "fresh-server-key"

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [aws_security_group.vault_sg.id]

  user_data = file("${path.module}/install_vault.sh")
}

resource "aws_security_group" "vault_sg" {
  name        = "vault-sg"
  description = "Allow Vault and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
