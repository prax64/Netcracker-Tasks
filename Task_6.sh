#!/bin/bash
DIRECTORY=/tmp/tmp4/

rm -rf $DIRECTORY
#test case
mkdir $DIRECTORY 2> /dev/null
cd $DIRECTORY
touch 1 2 3 4 5 6 7 8 9 > /dev/null
mkdir new_dir1 new_dir2 new_dir3 2> /dev/null
sudo su
groupadd operator

for i in /tmp/tmp4/* ; do
    if [ -f "$i" ]; then
        date --set 01/01/2018
        touch -mad "2018-01-01 00:00:00" "$i"
    fi
    if [ -d "$i" ]; then
        chgrp operator "$i"
    fi
done

timedatectl set-ntp true
exit