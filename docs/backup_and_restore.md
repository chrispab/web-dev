# Backup/Restore DBs

## DATABASE IMPORT with a sql file (mariadb must be started)

note: untar if needed

`docker exec -i mariadb mysql -uroot -ptriathlon123 <dbname>/db-import-data/<dbname>.sql`

`docker exec -i mariadb mysql -uroot -ptriathlon123 eos < db_import_data/sql_dump/from_dev/eos_dev_export_2023-06-29_dump.sql`

### survey DB import
`docker exec -i mariadb mysql -uroot -ptriathlon123 eos < db_import_data/sql_dump/from_live/survey_dump/survey_live_export_2023-07-12_dump.sql`


---
## How to backup and restore ALL DBs using tar.gz (mariadb NOT running-stopped)

stop the db service first

### backup the db to transport it

run in proj root
`docker run --rm -v $(pwd):/backup ubuntu tar cvf /backup/db_backup/database-data_backup_2023_07_03.tar backup/database-data`

compressed
docker run --rm -v $(pwd):/backup ubuntu tar -czvf /backup/db_backup/database-data_backup_2023_07_10_3.tar.gz backup/database-data


docker run --rm -v $(pwd):/backup ubuntu tar -czvf /backup/db_backup/database-data_backup_2023_07_11.tar.gz backup/database-data

//tar -czvf name-of-archive.tar.gz  <source_folder>

tar -czvf web-dev-2023-07-12.tar.gz  web-dev


### restore db

run in proj root
the destination folder '/database-data' must be emptied
`docker run --rm -v $(pwd):/backup ubuntu bash -c "cd /backup && tar xvf /backup/db_backup/dbbackup.tar --strip 1"`

---

## rsync

```bash
rsync -anvP ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/m2
```

### h:sabrent source to backup

```BASH
backup sabrent source to pc HD myBackups
//no db backups copied - for slow usb
sudo rsync -avhP --exclude 'db_backup/*' /media/chris/sabrent/web-dev ~/dev/myBackups/2023-07-10/

//with db backups
sudo rsync -avhP /media/chris/sabrent/web-dev ~/dev/myBackups/2023-07-11/


//copy sabrent src to laptop working folder
sudo rsync -avhP /media/chris/sabrent/web-dev ~/dev/



sudo rsync -avhP /media/chris/sabrent/web-dev /media/chris/CRU_480_USB/myBackups/2023-07-10_2/

sudo rsync -avhPn --delete /media/chris/sabrent/web-dev /media/chris/CRU_480_USB/



backup sabrent source to work laptop HD
sudo rsync -avhP --exclude '/media/chris/sabrent/web-dev/db_backup/*' /media/chris/sabrent/web-dev ~/dev/myBackups/2023-07-10_3/

sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/web-dev-backups/2/
sudo rsync -anvP --delete /media/chris/sabrent /media/chris/CRU_480_USB/

sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/backups/
sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/backups2/
sudo rsync -anvP --delete /media/chris/sabrent/web-dev /media/chris/TOSH_USB

sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/web-dev-DC-v1

sudo rsync -anvP ~/dev/backups/web-dev /media/chris/sabrent/
```

## Fancy using a volume - db data backup

<https://docs.docker.com/storage/volumes/#back-up-a-volume>

### Back up a volume

For example, create a new container named dbstore:
`docker run -v /dbdata --name dbstore ubuntu /bin/bash`

In the next command:

Launch a new container and mount the volume from the dbstore container
Mount a local host directory as /backup
Pass a command that tars the contents of the dbdata volume to a backup.tar file inside our /backup directory.
`docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata`
When the command completes and the container stops, it creates a backup of the dbdata volume.

### Restore volume from a backup

With the backup just created, you can restore it to the same container, or to another container that you created elsewhere.

For example, create a new container named dbstore2:

`docker run -v /dbdata --name dbstore2 ubuntu /bin/bash`

Then, un-tar the backup file in the new container’s data volume:
`docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"`
docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"

<https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes>

############
run in proj root
