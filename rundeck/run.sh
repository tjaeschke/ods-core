#!/bin/sh

# Copy all the custom configuration injected in folder /rundeck-config into
# $RDECK_BASE/server/config/ . If there are no files or they are empty, nothing
# is copied
if [ -n "$(ls -A /rundeck-config)" ]
then
  for f in /rundeck-config/*
  do
    if [ -s $f ]
    then
      envsubst < $f > $RDECK_CONFIG/`basename $f`
    fi
  done
fi

source /etc/rundeck/profile
exec $rundeckd
