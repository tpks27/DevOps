#!/bin/bash
# Apache Httpd Server installation
# It is free and open-source web server, which is used to deliver the web content using the internet
cd /etc
cd yum.repos.d
cd
pwd
# /home/ec2-user
sudo yum install httpd -y
#To check the status of this package
service httpd status 
#To run this package
sudo service httpd start
