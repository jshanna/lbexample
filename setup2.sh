#!/bin/bash

yum install nginx -y
sed -i /etc/nginx/nginx.conf -re '40,86d'
cp /lbexample/example.conf /etc/nginx/conf.d

mkdir -p /var/www/example
cp /lbexample/terrynoback.png /var/www/example
sed -e "s@BGCOLOR@$(tr -dc 'A-F0-9' < /dev/urandom | head -c6)@g;" /lbexample/index2.template > /var/www/example/index.html

service nginx start