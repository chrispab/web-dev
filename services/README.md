### Setting up local hosts
#### local host additions
```
127.0.0.1 dev-www.gotri.org
127.0.0.1 dev-intranet.britishtriathlon.org
127.0.0.1 dev-test.britishtriathlon.org
127.0.0.1 dev-www.britishtriathlon.org
127.0.0.1 dev-swimbikerun.britishtriathlon.org
127.0.0.1 dev-events.britishtriathlon.org

additional?
const UPLOADS_URL = 'http://dev.uploads.britishtriathlon.org/';// to local upload dir for mem images etc
```

-------------------------website-------------------
### Setting up website - required items
- website folder: 'website'
- website db: 'btf_test'
- lib folder: 'lib'
- website pimcore folder: 'pimcore' is within website folder
- website pimcore db: 'pimcore'

#### method
1. copy lib folder into www/vhosts
2. copy website folder into www/vhosts
3. import btf_test db
4. import pimcore db
5. mod settings for db host to mariadb
6. apply pimcore permissions

#### copy over folders
copy website and lib folder into www/vhosts
#### import btf_test db
run from project root folder

`docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test_minimal.sql`
`docker exec -i mariadb mysql -uroot -ptriathlon123 btf_test < db_import_data/btf_test_dev_2022-10-26_dump.sql`

#### import pimcore db
run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore < db_import_data/pimcore.sql`

#### edit/update pimcore system.php or
`sed -i 's/"host" => "localhost"/"host" => "mariadb"/' /var/www/vhosts/website/website/var/config/system.php`
"domain" => "dev.britishtriathlon.org",
 "domain" => "dev-www.britishtriathlon.org",


    const UPLOADS_URL                   = 'http://dev-uploads.britishtriathlon.org/';// to local upload dir for mem images etc
        "debug" => TRUE,
        "debug_ip" => "",

----------------------------Intranet--------------------------------
### Setting up Intranet - required items
- intranet folder: 'intranet'
- intranet db: 'iweb_new'
- intranet pimcore folder: 'pimcore' is within intranet folder
- intranet pimcore db: 'pimcore'

#### method
3. import iweb_new db (pimcore - intranet)
5. mod settings for db host to mariadb
6. apply pimcore permissions

#### copy over folders
copy intranet folder into www/vhosts
#### import iweb_new pimcore db
run from project root folder

`docker exec -i mariadb mysql -uroot -ptriathlon123 iweb_new < db_import_data/iweb_new.sql`
`sed -i 's/"host" => "localhost"/"host" => "mariadb"/' www/vhosts/intranet/website/var/config/system.php`
"dbname" => "iweb_new",
"host" => "mariadb",
"domain" => "",
"domain" => "dev-intranet.britishtrithlon.org",

        "debug" => TRUE,
        "debug_ip" => "",

"SQLSTATE[HY000]: General error: 1449 The user specified as a definer ('pimcore'@'131.231.186.3') does not exist, query was: SELECT SQL_CALC_FOUND_ROWS object_1.o_id as o_id, `object_1`.`o_type` FROM `object_1` WHERE ((domain = 'dev-intranet.britishtriathlon.org'  AND  object_1.o_type IN ('object','folder')) AND object_1.o_published = 1) LIMIT 1"

https://stackoverflow.com/questions/10169960/mysql-error-1449-the-user-specified-as-a-definer-does-not-exist

`The user specified as a definer ('someuser'@'%') does not exist`
MariaDb:
```
GRANT ALL PRIVILEGES ON *.* TO 'pimcore'@'131.231.186.3' IDENTIFIED BY 'complex-password';
FLUSH PRIVILEGES;
```
make any required changes for lib in file www/vhosts/lib/constants/Core.php???



-------------------------------eos
### eos
copy over eos folder

import db
run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 eos < db_import_data/eos.sql`

in www/vhosts/eos/application/config/database.php
change db host from local to mariadb

in www/vhosts/eos/application/config/config.php
$config['base_url']	= 'http://dev.events.britishtriathlon.org/';
$config['base_url']	= 'http://dev-events.britishtriathlon.org/';

$config['uploads_url'] = 'http://dev.uploads.britishtriathlon.org/';
$config['uploads_url'] = 'http://dev-uploads.britishtriathlon.org/';



------------------sbr
### Setup SwimBikeRun
SBR is effectively a fork of GOTRI atm, renamed as http://dev.swimbikerun.britishtriathlon.org/
#### import pimcore_sbr db
run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore_sbr < db_import_data/pimcore_sbr.sql`


check db is correct in /var/www/vhosts/sbr/website/var/config/system.php

#### import gotri db
run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 gotri < db_import_data/gotri.sql`

env vars in dockerfile
#### mod settings for db host to mariadb
run from project root folder

`sudo sed -i 's/"host" => "localhost"/"host" => "mariadb"/' www/vhosts/website/website/var/config/system.php`
`sudo sed -i 's/"host" => "localhost"/"host" => "xmariadbx"/' www/vhosts/website/website/var/config/system.php`

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
docker-compose --verbose up


###Submodules
add each repo as a submodule in the docker dev environment
within vhosts
add gotri as a submodule named in folder sbr
current live gotri is in repo 'gotri_latest'
https://bitbucket.org/britishtriathlon/gotri_latest/src/master/
git clone git@bitbucket.org:britishtriathlon/gotri_latest.git
git submodule add git@bitbucket.org:britishtriathlon/gotri_latest.git sbr


/home/chris/.ssh/known_hosts:4


git remote add origin_bitbucket git@bitbucket.org:britishtriathlon/gotri_latest.git

There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

git pull origin_bitbucket master

git clone git@bitbucket.org:britishtriathlon/gotri_latest.git sbr

