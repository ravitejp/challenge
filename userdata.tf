#!/bin/bash
yum -y install httpd
yum -y install vim
yum -y install mod_ssl openssl
setenforce 0
#echo "Hello World!" > /var/www/html/index.html
cat >/var/www/html/index.html <<EOL
<html>

<head>

<title>Hello World</title>

</head>

<body>

<h1>Hello World!</h1>

</body>

</html>

EOL
cd /tmp && openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/IL=Denial/L=Springfield/O=Dis/CN=ca" \
    -keyout localhost.key  \
    -out localhost.crt
mv /etc/pki/tls/certs/localhost.crt /tmp/old.crt
mv /etc/pki/tls/private/localhost.key /tmp/old.key
cp -far /tmp/localhost.crt  /etc/pki/tls/certs/localhost.crt
cp -far /tmp/localhost.key  /etc/pki/tls/private/localhost.key
cat >>/etc/httpd/conf/httpd.conf <<EOL
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}:443%{REQUEST_URI}
#RewriteRule (.*) https://%{SERVER_NAME}/%$1 [R,L]

EOL
systemctl start httpd