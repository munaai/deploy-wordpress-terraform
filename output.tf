output "wordpress_public_ip" {
  value = module.wordpress.public_ip
}

output "vault_public_ip" {
  value = module.vault.public_ip
}
