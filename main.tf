module "vpc" {
  source                 = "./vendor/modules/vpc"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  cidr_block             = var.cidr_block
}
