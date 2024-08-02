#! /bin/bash
sudo yum update -y
sudo yum clean metadata
sudo yum install mariadb105-server -y
sudo mysql -V
sudo yum install -y telnet