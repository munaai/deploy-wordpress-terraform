# Launch EC2 instance
resource "aws_instance" "wordpress-ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    associate_public_ip_address = true
  
}
# Use user_data script to:
# Install Apache, PHP, MySQL, and WordPress
# Download WordPress from wordpress.org
# Use secrets fetched from Vault (DB user/pass)