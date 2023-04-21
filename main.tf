module "vpc" {
  source        = "./vendor/modules/vpc"
  cidr_block       = var.cidr_block
}

# This always goes with the main branch, so how can I tell this module pick the code from the intended branch