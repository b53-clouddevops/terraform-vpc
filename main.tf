module "vpc" {
  source = "git::https://github.com/b53-clouddevops/tf-module-vpc.git?ref=main"
}

# This always goes with the main branch, so how can I tell this module pick the code from the intended branch