#!/bin/sh

ARG_FROM=${1}
ARG_TO=${2}

# copping itself
sudo docker cp $ARG_FROM $ARG_TO

# assign copping permissions
sudo chmod -R 775 $ARG_TO
