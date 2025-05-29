output "public_ip" {
  description = "The public IP address of the Vault instance"
  value       = aws_instance.vault.public_ip
}
