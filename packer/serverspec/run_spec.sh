#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/

HOST_IP=$1
PORT=$2
SSH_KEY=$3
HOST=$4
USER=$5

env TARGET_SSH_KEY="${SSH_KEY}" TARGET_HOST_IP=${HOST_IP} TARGET_PORT=${PORT} USER=${USER} bundle exec rake spec:${HOST}

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et