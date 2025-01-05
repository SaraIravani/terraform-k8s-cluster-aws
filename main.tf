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

module "master_nodes" {
  source             = "./modules/master-nodes"
  cluster_name       = var.cluster_name
  environment        = var.environment
  master_count       = var.master_count
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = var.subnet_ids
  security_group_id  = module.security_groups.master_sg_id
}

#  source = "./modules/worker-nodes"
#  vpc_id = module.vpc.vpc_id
#  ami_id        = data.aws_ami.latest_ami.id
#  instance_type = var.instance_type
#  count         = var.master_count
#}
module "security_groups" {
  source = "./modules/security-groups"

  cluster_name          = var.cluster_name
  allowed_ssh_ips      = var.allowed_ssh_ips
  master_cidr_blocks   = var.master_cidr_blocks
  worker_cidr_blocks   = var.worker_cidr_blocks
  etcd_cidr_blocks     = var.etcd_cidr_blocks
  storage_cidr_blocks  = var.storage_cidr_blocks
}
data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

