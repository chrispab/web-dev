https://unix.stackexchange.com/questions/66878/how-can-i-replace-text-after-a-specific-word-using-sed



Search for a line that starts with projdir, and replace the whole line with a new one:

sed -i 's/^projdir .*$/projdir PacMan/' .ignore

^ and $ are beginning/end-of-line markers, so the pattern will match the whole line; .* matches anything. The -i tells sed to write the changes directly to .ignore, instead of just outputting them

https://unix.stackexchange.com/questions/89913/sed-ignore-line-starting-whitespace-for-match
Change your matching pattern no catch white spaces before liste in the following way:

/^\s*Listen/

www/vhosts/website/website/var/config/system.php
sudo sed -i 's/"host" => "localhost"/"host" => "mariadb"/' www/vhosts/website/website/var/config/system.php



##############
when branch upto date but git lists all files as modified and ready to be commited
https://stackoverflow.com/questions/5787937/git-status-shows-files-as-changed-even-though-contents-are-the-same



https://dev-www.britishtriathlon.org/my-account/online-entry?raceItem=48997