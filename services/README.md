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

### Setup SwimBikeRun
SBR is effectively a fork of GOTRI atm, renamed as http://dev.swimbikerun.britishtriathlon.org/
#### import pimcore_sbr db
run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 pimcore_sbr < db_import_data/pimcore_sbr.sql`

### eos
copy over web folder

run from project root folder
`docker exec -i mariadb mysql -uroot -ptriathlon123 eos < db_import_data/eos.sql`

in www/vhosts/eos/application/config/database.php
change db host from local to mariadb

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

#hosts additions
```
127.0.0.1 dev.gotri.org
127.0.0.1 dev-intranet.britishtriathlon.org
127.0.0.1 dev-test.britishtriathlon.org
127.0.0.1 dev-www.britishtriathlon.org
127.0.0.1 dev-swimbikerun.britishtriathlon.org
127.0.0.1 dev-events.britishtriathlon.org
```