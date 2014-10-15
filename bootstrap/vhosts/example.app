<VirtualHost *:80>
  ServerName example.app
  DocumentRoot "/home/vagrant/example/public"
  <Directory "/home/vagrant/example/public">
  	Options FollowSymLinks
    AllowOverride all
  </Directory>
</VirtualHost>