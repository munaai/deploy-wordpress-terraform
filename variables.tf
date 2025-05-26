# Wordpress variables
variable "wordpress_instance_type" {
    type = string
    description = "EC2 instance type for Wordpress server"
}

variable "wordpress_instance_name" {
  type        = string
  description = "Name tag for the WordPress EC2 instance"
}

variable "wordpress_ami_id" {
  type        = string
  description = "AMI ID for the WordPress EC2 instance"
}

# VPC variables 
  
variable "vpc_cidr_block" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "public_subnet_cidr" {
    type = string
}

variable "availability_zone" {
    type = string
}