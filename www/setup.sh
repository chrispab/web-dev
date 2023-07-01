#!/usr/bin/env bash

# php app.php my-migration-command    # run migrations
# service cron start                  # start some services


echo "setting up website pimcore file permissions"
# sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/website/website/var/config/system.php
cd /var/www/vhosts/website
chown -R www-data:www-data pimcore website/var

echo "setting up intranet pimcore file permissions"
# sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/intranet/website/var/config/system.php
cd /var/www/vhosts/intranet
chown -R www-data:www-data pimcore website/var

echo "setting up gotri pimcore file permissions"
# sed -i 's/"host" => "db_server_10_0_0_38"/"host" => "mariadb"/' /var/www/vhosts/gotri_new/website/var/config/system.php
cd /var/www/vhosts/gotri_new
chown -R www-data:www-data pimcore website/var

echo "setting up sbr pimcore file permissions"
# sed -i 's/"host" => "10.0.0.3"/"host" => "mariadb"/' /var/www/vhosts/sbr/website/var/config/system.php
cd /var/www/vhosts/sbr
chown -R www-data:www-data pimcore website/var

apache2-foreground             # main execution