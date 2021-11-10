#!/bin/bash
DIRECTORY=/tmp/tmp4/

#rm -rf $DIRECTORY

if [[ -d $DIRECTORY && -f "${DIRECTORY}file0"&& -f "${DIRECTORY}file1" && -f "${DIRECTORY}file2" ]]
then
  echo "The script failed"
  exit 1
else
  mkdir $DIRECTORY
  cd $DIRECTORY
  touch file0 file1 file2
  chmod 600 file0
  chmod 610 file1
  chmod 666 file2
  echo 'Completed successfully'
  exit 0
fi