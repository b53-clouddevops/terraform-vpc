module "vpc" {
  source        = "./vendor/modules/vpc"
  cidr_block       = var.VPC_CIDR
}
