#!/usr/bin/env bash

# php app.php my-migration-command    # run migrations
# service cron start                  # start some services


echo "setting pimcore permissions"
sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/website/website/var/config/system.php
sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/intranet/website/var/config/system.php
sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/gotri_new/website/var/config/system.php

cd /var/www/vhosts/website
chown -R www-data:www-data pimcore website/var

cd /var/www/vhosts/intranet
chown -R www-data:www-data pimcore website/var

cd /var/www/vhosts/gotri_new
chown -R www-data:www-data pimcore website/var

apache2-foreground             # main execution