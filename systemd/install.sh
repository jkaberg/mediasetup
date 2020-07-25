#!/bin/bash

PATH=$(pwd)
FILES=$(/usr/bin/find "$PATH" -name '*.service' -o -name '*.mount')

for f in $FILES
do
  FILE=$(/usr/bin/basename -- "$f")
  /usr/bin/sudo /bin/ln -s "$f" /etc/systemd/system/"${FILE}"
done

/usr/bin/sudo /bin/systemctl daemon-reload

