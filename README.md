
# setup steps

1. Clone this repo
2. Setup local hosts file
3. Copy each website folder into www/vhosts folder
4. Setup needed permissions
5. modify any required configuration files/setting
6. Start the docker container
7. import databases from sql dump files or from tar backup
8. done

## local host additions

```BASH

127.0.0.1 dev-test.britishtriathlon.org
127.0.0.1 dev-www.gotri.org
127.0.0.1 dev-intranet.britishtriathlon.org
127.0.0.1 dev-www.britishtriathlon.org
127.0.0.1 dev-swimbikerun.britishtriathlon.org
127.0.0.1 dev-events.britishtriathlon.org
127.0.0.1 dev-uploads.britishtriathlon.org
```
## urls:

http://dev-test.britishtriathlon.org
http://127.0.0.1:8080
https://dev-www.gotri.org
https://dev-www.britishtriathlon.org
https://dev-intranet.britishtriathlon.org/
https://dev-swimbikerun.britishtriathlon.org/
https://dev-events.britishtriathlon.org/


## DATABASE EXPORT

`docker exec mariadb /usr/bin/mysqldump -u root --password=triathlon123 <dbname> > db-export-data/<dbname>_export.sql`

## DATABASE IMPORT

`docker exec -i mariadb mysql -uroot -ptriathlon123 <dbname> < db-import-data/<dbname>.sql`

`docker exec -i mariadb mysql -uroot -ptriathlon123 eos < db_import_data/sql_dump/from_dev/eos_dev_export_2023-06-29_dump.sql`

<https://stackoverflow.com/questions/65585749/how-to-import-a-mysql-dump-file-into-a-docker-mysql-container>
volumes:

- ${PWD}/config/start.sql:/docker-entrypoint-initdb.d/start.sql

## LOG INTO web server BASH

```BASH
docker exec -it php-apache bash
cd vhosts/gotri_new
```

### set perms for pimcore

`chown -R www-data:www-data pimcore website/var`

## useful Docker commands

```BASH
docker ps
docker ps -all
docker ps -a
docker compose up
docker compose down
```

## Misc

`web-dev/www/vhosts/gotri_new/website/var/config/system.php`
has

```YAML
"database" => [
        "adapter" => "Pdo_Mysql",
        "params" => [
            "username" => "root",
            "password" => "triathlon123",
            "dbname" => "pimcore_gotri",
            "host" => "mariadb",
            "port" => "3306"
        ]
    ],
```

xdebug
<https://stackoverflow.com/questions/49907308/installing-xdebug-in-docker>
<https://dev.to/jackmiras/xdebug-in-vscode-with-docker-379l>
