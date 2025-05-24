module "wordpress" {
    source = "./modules/wordpress"
    instance_name = var.wordpress_instance_name
    ami_id = var.wordpress_ami_id
    instance_type = var.wordpress_instance_type
    subnet_id = var.wordpress_subnet_id
}

module "vault" {
    source = "./modules/vault"
}

module "vpc" {
    source = "./modules/vpc"
}