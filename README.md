# FOR DATABASE EXPORT

docker exec mariadb /usr/bin/mysqldump -u root --password=triathlon123 dbname > db-export-data/dbname_export.sql

# FOR DATABASE IMPORT

docker exec -i mariadb mysql -uroot -ptriathlon123 dbname < db-import-data/dbname.sql

<https://stackoverflow.com/questions/65585749/how-to-import-a-mysql-dump-file-into-a-docker-mysql-container>
volumes:

- ${PWD}/config/start.sql:/docker-entrypoint-initdb.d/start.sql

# LOG INTO web server BASH
docker exec -it php-apache bash

set perms for pimcore
chown -R www-data:www-data pimcore website/var
