terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "my-terraform-state-bucket-sara" # Replace with your S3 bucket
    key    = "k8s-cluster/terraform.tfstate"
    region = "ca-central-1"
  }
}

provider "aws" {
  region = "ca-central-1"
}

