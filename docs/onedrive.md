
export ONEDRIVE_DATA_DIR_WORK="/home/abraunegg/OneDriveWork"
mkdir -p ${ONEDRIVE_DATA_DIR_WORK}

docker run -it --restart unless-stopped --name onedrive_Work -v onedrive_conf_Work:/onedrive/conf -v "${ONEDRIVE_DATA_DIR_WORK}:/onedrive/data" driveone/onedrive:edge

-e "ONEDRIVE_UID=${ONEDRIVE_UID}" 


docker run -it --restart unless-stopped --name onedrive_Work -v onedrive_conf_Work:/onedrive/conf -v "${ONEDRIVE_DATA_DIR_WORK}:/onedrive/data" -e "ONEDRIVE_REAUTH=1" driveone/onedrive:edge


docker run -it --name onedrive -v onedrive_conf:/onedrive/conf \
    -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    driveone/onedrive:edge

docker run -it --name onedrive -v onedrive_conf:/onedrive/conf \
    -v "${ONEDRIVE_DATA_DIR}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    -e "ONEDRIVE_REAUTH=1" \
    driveone/onedrive:edge    