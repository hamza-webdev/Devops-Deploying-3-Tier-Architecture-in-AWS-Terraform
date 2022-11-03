# Author    : Hamza
# GitHub    : https://github.com/hamza-webdev/Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform.git
########################################################

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}
