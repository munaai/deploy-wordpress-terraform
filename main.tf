module "wordpress" {
    source = "./modules/wordpress"
}

module "vault" {
    source = "./modules/vault"
}

module "vpc" {
    source = "./modules/vpc"
}