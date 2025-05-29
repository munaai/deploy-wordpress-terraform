module "wordpress" {
    source = "./modules/wordpress"
    instance_name = var.wordpress_instance_name
    ami_id = var.wordpress_ami_id
    instance_type = var.wordpress_instance_type
    #subnet_id = var.wordpress_subnet_id
    subnet_id = module.vpc.public_subnet_id
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_name = var.vpc_name
    public_subnet_cidr = var.public_subnet_cidr
    availability_zone = var.availability_zone
}

module "vault" {
  source         = "./modules/vault"
  instance_name  = var.vault_instance_name
  ami_id         = var.vault_ami_id
  instance_type  = var.vault_instance_type
  subnet_id      = module.vpc.public_subnet_id
}
