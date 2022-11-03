# Author    : Hamza
# GitHub    : https://github.com/hamza-webdev/Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform.git
########################################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
