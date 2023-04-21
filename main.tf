module "vpc" {
  source        = "./vendor/modules/vpc"
  cidr_block       = var.cidr_block
}
