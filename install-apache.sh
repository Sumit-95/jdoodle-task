#!/bin/bash

# Install Apache on Ubuntu
sudo apt update
sudo apt -y upgrade
# apache installation, enabling and status check
sudo apt -y install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2 | grep Active
# firewall installation, start, and status check
sudo apt -y install ufw
sudo ufw enable
sudo ufw status
# adding http services
sudo ufw allow http
# reloading the firewall
sudo ufw reload

sudo tee /var/www/html/index.html > /dev/null << EOF
<html>
<head>
  <title> Jdoodle </title>
</head>
<body>
  <p> Jdoodle task </p>
</body>
</html>
EOF
