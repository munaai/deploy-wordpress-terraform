output "public_ip" {
  description = "The public IP address of the WordPress instance"
  value       = aws_instance.wordpress_ec2.public_ip
}
