https://unix.stackexchange.com/questions/66878/how-can-i-replace-text-after-a-specific-word-using-sed



Search for a line that starts with projdir, and replace the whole line with a new one:

sed -i 's/^projdir .*$/projdir PacMan/' .ignore

^ and $ are beginning/end-of-line markers, so the pattern will match the whole line; .* matches anything. The -i tells sed to write the changes directly to .ignore, instead of just outputting them

https://unix.stackexchange.com/questions/89913/sed-ignore-line-starting-whitespace-for-match
Change your matching pattern no catch white spaces before liste in the following way:

/^\s*Listen/

www/vhosts/website/website/var/config/system.php
sudo sed -i 's/"host" => "localhost"/"host" => "mariadb"/' www/vhosts/website/website/var/config/system.php

rsync -anvP ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/sabrent

rsync -anvP --delete ~/dev/docker/web-dev /media/chris/m2


h:sabrent to backup
sudo rsync -anvP /media/chris/sabrent/web-dev ~/dev/backups/
sudo rsync -anvP ~/dev/backups/web-dev /media/chris/sabrent/


sudo rsync -anvP /media/chris/sabrent/web-dev /media/chris/TOSH_USB


https://docs.docker.com/storage/volumes/#back-up-a-volume
https://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes

docker run -v /dbdata --name dbstore ubuntu /bin/bash

docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

docker run -v /dbdata --name dbstore2 ubuntu /bin/bash

docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"


############
run in proj root 
docker run --rm -v $(pwd):/backup ubuntu tar cvf /backup/dbbackup.tar /database-data
chris@Ox-7020:/media/chris/sabrent/web-dev$ docker run --rm  -v $(pwd):/backup ubuntu tar cvf /backup/dbbackup.tar backup//database-data
