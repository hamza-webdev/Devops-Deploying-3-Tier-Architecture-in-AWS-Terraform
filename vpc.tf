# Author    : Hamza
# GitHub    : https://github.com/hamza-webdev/Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform.git
########################################################

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "CustomVPC"
  }
}
