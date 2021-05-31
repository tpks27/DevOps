#!/bin/bash
#MariaDB installation
sudo yum install mariadb-server -y
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
sudo systemctl status mariadb.service
mysql -u root
#history
