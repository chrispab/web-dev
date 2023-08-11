## FIRST RUN
export ONEDRIVE_DATA_DIR_WORK="/home/chris/OneDrive"
mkdir -p ${ONEDRIVE_DATA_DIR_WORK}

docker run -it --restart unless-stopped --name onedrive_Work -v onedrive_conf_Work:/onedrive/conf -v "${ONEDRIVE_DATA_DIR_WORK}:/onedrive/data" driveone/onedrive:edge

-e "ONEDRIVE_UID=${ONEDRIVE_UID}" 


docker run -it --restart unless-stopped --name onedrive_Work -v onedrive_conf_Work:/onedrive/conf -v "${ONEDRIVE_DATA_DIR_WORK}:/onedrive/data" -e "ONEDRIVE_REAUTH=1" driveone/onedrive:edge



export ONEDRIVE_DATA_DIR="/home/chris/OneDrive"

docker run -it --name onedrive -v onedrive_conf:/onedrive/conf \
    -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    driveone/onedrive:edge


to re-auth and restart
gid=1000(chris) groups=1000(chris)
export ONEDRIVE_DATA_DIR="/home/chris/OneDrive"

docker run -it --name onedrive -v onedrive_conf:/onedrive/conf \
    -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    -e "ONEDRIVE_REAUTH=1" \
    driveone/onedrive:edge
    
        

-- run this to restart the onedrive container

export ONEDRIVE_UID=`id -u`
export ONEDRIVE_GID=`id -g`
export ONEDRIVE_DATA_DIR="${HOME}/OneDrive"
mkdir -p ${ONEDRIVE_DATA_DIR}
docker run -it --name onedrive -v onedrive_conf:/onedrive/conf \
    -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    driveone/onedrive:edge