## Setting up gotri site and DB

'gotri' db
'pimcore_gotri' db

'gotri_new' web folder

# run from project root folder

docker exec -i mariadb mysql -uroot -ptriathlon123 gotri < db_import_data/gotri.sql
docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore_gotri < db_import_data/pimcore_gotri.sql

# LOG INTO web server BASH

docker exec -it php-apache bash
cd vhosts/gotri_new

# set perms for pimcore

chown -R www-data:www-data pimcore website/var

## Setting up gotri site and DB

docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test.sql

<!-- docker exec -i btf_5.6_projects-db mysql -uroot -ptriathlon123 pimcore_gotri < ../webproject/database-to-import/pimcore_gotri.sql -->

# LOG INTO web server BASH

docker exec -it php-apache bash
cd vhosts/website

# set perms for pimcore

chown -R www-data:www-data pimcore website/var
