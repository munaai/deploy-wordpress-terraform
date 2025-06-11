resource "aws_instance" "wordpress_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    associate_public_ip_address = true #Enables a public IP so it can be connected from the internet
    key_name = "fresh-server-key"
    tags = {
    Name = var.instance_name
    }
    # The below connects the EC2 instance to the security group  — this ensures only the allowed traffic (SSH + HTTP) can reach the server.
    vpc_security_group_ids = [aws_security_group.wordpress_sg.id]

    user_data = file("${path.module}/install_wordpress.sh")
}

  # This resource creates security group
  resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-sg"
  description = "Allow HTTP (PORT 80) and SSH (PORT 22) for WordPress"
  vpc_id      = var.vpc_id  # ← pass in the VPC ID from the main module

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
