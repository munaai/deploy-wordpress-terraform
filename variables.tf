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

variable "wordpress_subnet_id" {
  type        = string
  description = "Subnet ID where the WordPress instance will be launched"
}