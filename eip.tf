# Author    : Hamza
# GitHub    : https://github.com/hamza-webdev/Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform.git
########################################################

resource "aws_eip" "myeip" {
  //instance = aws_instance.web.id
  vpc      = true
}
