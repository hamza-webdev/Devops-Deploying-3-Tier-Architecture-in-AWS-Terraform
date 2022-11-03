# Author    : Hamza
# GitHub    : https://github.com/hamza-webdev/Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform.git
########################################################

resource "aws_instance" "web" {
#   ami           = "ami-0493936afbe820b28" # Ubuntu server
  ami           = "ami-02b01316e6e3496d9"
  instance_type = "t2.micro"
  key_name = "AWS_PAIRE_KEY_TERRAFORM"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "WebServer-2022"
  }

  provisioner "file" {
    source = "./AWS_PAIRE_KEY_TERRAFORM.pem"
    destination = "/home/ubuntu/AWS_PAIRE_KEY_TERRAFORM.pem"

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("./AWS_PAIRE_KEY_TERRAFORM.pem")}"
    }
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0493936afbe820b28"
  instance_type = "t2.micro"
  key_name = "AWS_PAIRE_KEY_TERRAFORM"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server 2022"
  }
}
