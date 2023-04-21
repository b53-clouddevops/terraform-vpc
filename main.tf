module "vpc" {
  source               = "./vendor/modules/vpc"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  VPC_CIDR             = var.VPC_CIDR
}
