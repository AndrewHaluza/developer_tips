ARG_OLD_TEXT=${1}
ARG_NEW_TEXT=${2}
ARG_FILE_PATH=${3}

sed -i "s/$ARG_OLD_TEXT/$ARG_NEW_TEXT/" "$ARG_FILE_PATH"