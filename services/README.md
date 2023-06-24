### Setting up local hosts



### Setting up website
- lib folder: 'lib'
- pimcore folder: 'pimcore' is within website folder
- db: 'pimcore'
- website folder: 'website'
- db: 'btf_test'

1. copy lib folder into www/vhosts
2. copy website folder into www/vhosts
3. import btf_test db
4. import pimcore db
5. mod settings for db host to mariadb
6. apply pimcore permissions

#### import btf_test db
copy website and lib folder into www/vhosts
#### import btf_test db
run from project root folder

`docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test.sql`

#### import pimcore db
run from project root folder

`docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore < db_import_data/pimcore.sql`



env vars in dockerfile
#### mod settings for db host to mariadb
run from project root folder

`sudo sed -i 's/"host" => "localhost"/"host" => "mariadb"/' www/vhosts/website/website/var/config/system.php`
#### apply pimcore permissions
```
docker exec -it php-apache bash
cd vhosts/website
chown -R www-data:www-data pimcore website/var
```
#### set perms for pimcore

`chown -R www-data:www-data pimcore website/var`

---


## Setting up gotri site and DB

'gotri' db
'pimcore_gotri' db

'gotri_new' web folder

#### run from project root folder

docker exec -i mariadb mysql -uroot -ptriathlon123 gotri < db_import_data/gotri.sql
docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore_gotri < db_import_data/pimcore_gotri.sql

#### LOG INTO web server BASH

docker exec -it php-apache bash
cd vhosts/gotri_new

#### set perms for pimcore

chown -R www-data:www-data pimcore website/var

## Setting up gotri site and DB

docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test.sql

<!-- docker exec -i btf_5.6_projects-db mysql -uroot -ptriathlon123 pimcore_gotri < ../webproject/database-to-import/pimcore_gotri.sql -->

### Setting up intranet site


**web folder: 'intranet'**
**db: 'iweb_new'**
#### copy web folder into www/vhosts
#### import db to docker
run from project root folder

add
```
CREATE DATABASE iweb_new;
USE iweb_new;
```

import db
run from project root folder

```
docker exec -i mariadb mysql -uroot -ptriathlon123 iweb_new < db_import_data/iweb_new.sql
```
#### LOG INTO web server BASH

docker exec -it php-apache bash
cd vhosts/gotri_new

#### set perms for pimcore

chown -R www-data:www-data pimcore website/var

#### Setting up gotri site and DB

docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test.sql

<!-- docker exec -i btf_5.6_projects-db mysql -uroot -ptriathlon123 pimcore_gotri < ../webproject/database-to-import/pimcore_gotri.sql -->

#### LOG INTO web server BASH

docker exec -it php-apache bash
cd vhosts/website

#### set perms for pimcore

chown -R www-data:www-data pimcore website/var
