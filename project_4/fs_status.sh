#!/bin/bash

##############################
# Owner: sahithande
# Date: 27th-may
# Version: v1
# This script is to monitor the the disk space usage in a EC2 instance
##############################

FILE_UTIL=$(df -h | egrep -v "Filesystem|tmpfs|efivarfs" | grep "sda2" | awk -F' ' '{print $5}' | tr -d %)

if [[ $FILE_UTIL -ge 80 ]]
then
    echo "WARNING: Disk space is running low."
else
    echo "All good."
fi