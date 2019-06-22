sed "s@BGCOLOR@$(tr -dc 'A-F0-9' < /dev/urandom | head -c6)@g" index.html
sed "s@INSTANCE@$(curl http://169.254.169.254/latest/meta-data/instance-id)@g" index.html
sed "s@IPPUB@$(curl http://169.254.169.254/latest/meta-data/public-ipv4)@g" index.html
sed "s@IPPRIV@$(curl http://169.254.169.254/latest/meta-data/local-ipv4)@g" index.html
sed "s@AZ@$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)@g" index.html