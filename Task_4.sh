#!/bin/bash
FILE=/tmp/pc_info

rm -rf $FILE
touch $FILE

ARR=("/proc/cpuinfo" "/proc/meminfo" "/proc/devices" "/proc/mounts")
for i in "${ARR[@]}" ; do
  if [[ "$i" == /proc/meminfo ]]; then
      cat "$i" | grep -P 'MemTotal|MemFree|MemAvailable|Cached|SwapCached' >> $FILE
      else
        cat "$i" >> $FILE
  fi
  echo '//////////////////////////////////////////////////////' >> $FILE
done


