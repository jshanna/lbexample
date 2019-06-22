#!/bin/bash

yum install nginx -y
sed -i /etc/nginx/nginx.conf -re '40,86d'
cp /lbexample/example.conf /etc/nginx/conf.d

mkdir -p /var/www/example
sed -e "s@BGCOLOR@$(tr -dc 'A-F0-9' < /dev/urandom | head -c6)@g; s@INSTANCE@$(curl http://169.254.169.254/latest/meta-data/instance-id)@g; s@IPPUB@$(curl http://169.254.169.254/latest/meta-data/public-ipv4)@g; s@IPPRIV@$(curl http://169.254.169.254/latest/meta-data/local-ipv4)@g; s@AZ@$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)@g" index.template > /var/www/example/index.html

service nginx start