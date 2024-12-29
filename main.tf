module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "my-vpc"
  cidr                 = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "master-nodes" {
  source = "./modules/master-nodes" # Path to the master nodes module
  vpc_id = module.vpc.vpc_id
  # Additional parameters required for master nodes
}

module "worker-nodes" {
  source = "./modules/worker-nodes" # Path to the worker nodes module
  vpc_id = module.vpc.vpc_id
  # Additional parameters required for worker nodes
}

