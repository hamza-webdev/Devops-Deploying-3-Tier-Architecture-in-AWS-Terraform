# Devops-Deploying-3-Tier-Architecture-in-AWS-Terraform

Suivez la procédure de lancement d'une instance. Le champ Données utilisateur se trouve dans la section Détails avancés de l'assistant de lancement d'instance. Entrez votre script shell dans le champ Données utilisateur, puis terminez la procédure de lancement de l'instance.

Dans l'exemple de script ci-dessous, le script crée et configure notre serveur Web.

````
#!/bin/bash
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

````
