#!/bin/sh

ARG_REMOTE_HOST=${1}
ARG_HOST_SCRIPT=${2}
ARG_HOST_SCRIPT_ARGS=${3}

ssh $1 '/bin/sh -s' < $ARG_HOST_SCRIPT ${ARG_HOST_SCRIPT_ARGS}
