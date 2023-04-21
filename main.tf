module "vpc" {
  source                 = "./vendor/modules/vpc"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  VPC_CIDR               = var.VPC_CIDR
  ENV                    = var.ENV
  PUBLIC_SUBNET_CIDR     = var.PUBLIC_SUBNET_CIDR
  PRIVATE_SUBNET_CIDR    = var.PRIVATE_SUBNET_CIDR 
  AZ                     = var.AZ

}
