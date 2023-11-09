#!/bin/bash

# Initialize variables with default values
ARG_OLD_TEXT=""
ARG_NEW_TEXT=""
ARG_FILE_PATH=""
WITH_SUDO=false

# Process command line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --sudo)
            WITH_SUDO=true
            ;;
        *)
            if [ -z "$ARG_OLD_TEXT" ]; then
                ARG_OLD_TEXT="$1"
            elif [ -z "$ARG_NEW_TEXT" ]; then
                ARG_NEW_TEXT="$1"
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
if [ -z "$ARG_OLD_TEXT" ] || [ -z "$ARG_NEW_TEXT" ] || [ -z "$ARG_FILE_PATH" ]; then
    echo "Usage: $0 <old_text> <new_text> <file_path> [--sudo]"
    exit 1
fi

# Copy command
COMMAND="sed -i \"s/$ARG_OLD_TEXT/$ARG_NEW_TEXT/\" \"$ARG_FILE_PATH\""

if [ $WITH_SUDO = true ]; then
    sudo bash -c "$COMMAND"
else
    bash -c "$COMMAND"
fi

echo "Updated $ARG_OLD_TEXT to $ARG_NEW_TEXT in $ARG_FILE_PATH. (ARG_WITH_SUDO: $WITH_SUDO)"