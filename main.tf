terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "./modules/vpc"
  aws_region       = var.aws_region
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  cluster_name     = var.cluster_name
}

module "master-nodes" {
  source = "./modules/master-nodes"
  vpc_id = module.vpc.vpc_id
}
module "worker-nodes" {
  source = "./modules/worker-nodes"
  vpc_id = module.vpc.vpc_id
}
