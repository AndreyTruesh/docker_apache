rm -f ./var/www/html/index.html
tar -xzvf wordpress.tar.gz -C ./var/www/html/
cp -r ./var/www/html/wordpress/* ./var/www/html/
rm -rf ./var/www/html/wordpress
cp ./info.php ./var/www/html/

/etc/init.d/php7.3-fpm start

chown -R www-data:www-data /var/www/html

service mysql start
mysql --execute="CREATE DATABASE wordpress; \
	GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin'; \
	FLUSH PRIVILEGES;"

a2enmod rewrite
service apache2 start
bash
