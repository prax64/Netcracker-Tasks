#!/bin/bash

for file in /proc/*/status 
do 

	swap_usage_nums=$(cat $file | grep VmSwap | awk '{ print $2 }')
	if (( swap_usage_nums > 0 ))
	then
		swap_usage_unit=$(cat $file | grep VmSwap | awk '{ print $3 }')
		name=$(cat $file | grep Name | awk '{ print $2 }')
		echo "${name} ${swap_usage_nums}${swap_usage_unit}"
	fi

done | sort -h -r


