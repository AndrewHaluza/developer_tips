#!/bin/sh


# Initialize variables with default values
ARG_FROM=""
ARG_TO=""

WITH_SUDO=false

# Process command line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --sudo)
            WITH_SUDO=true
            ;;
        *)
            if [ -z "$ARG_FROM" ]; then
                ARG_FROM="$1"
            elif [ -z "$ARG_TO" ]; then
                ARG_TO="$1"
            elif [ -z "$ARG_FILE_PATH" ]; then
                ARG_FILE_PATH="$1"
            else
                echo "Ignoring extra argument: $1"
            fi
            ;;
    esac
    shift
done

# Check if any of the required arguments are missing
if [ -z "$ARG_FROM" ] || [ -z "$ARG_TO" ]; then
    echo "Usage: $0 <from> <to> [--sudo]"
    exit 1
fi

# Copy command
COMMAND_COPY="docker cp $ARG_FROM $ARG_TO"
# assign copping permissions
COMMAND_CHMOD="chmod -R 775 $ARG_TO"

if [ $WITH_SUDO = true ]; then
    sudo bash -c "$COMMAND_COPY"
    sudo bash -c "$COMMAND_CHMOD"
else
    bash -c "$COMMAND_COPY"
    bash -c "$COMMAND_CHMOD"
fi