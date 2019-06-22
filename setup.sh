#!/bin/bash

yum install nginx
cp example.conf /etc/nginx/conf.d

sed -f sedswaps index.html
mkdir /var/www/example
mv index.html /var/www/example

service nginx restart