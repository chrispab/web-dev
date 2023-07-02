# backups

## how to backup and restore db using tar

stop the db service first

### backup the db to transport it

run in proj root
`docker run --rm -v $(pwd):/backup ubuntu tar cvf /backup/db_backup/dbbackup.tar backup/database-data`

### restore db

run in proj root
`docker run --rm -v $(pwd):/backup ubuntu bash -c "cd /backup && tar xvf /backup/db_backup/dbbackup.tar --strip 1"`

## rsync

```bash
rsync -anvP ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/m2
```

### h:sabrent source to backup

```BASH
sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/backups/
sudo rsync -anvP --delete /media/chris/sabrent/web-dev ~/dev/backups2/
sudo rsync -anvP --delete /media/chris/sabrent/web-dev /media/chris/TOSH_USB

sudo rsync -anvP ~/dev/backups/web-dev /media/chris/sabrent/
```

## db data backup

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
