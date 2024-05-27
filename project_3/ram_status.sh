#!/bin/bash

#############################
# Owner: sahithande
# Date: 27th-may
# Version: v1
# This script will monitor the RAM space in an EC2 instance
#############################


FREE_SPACE=$(free -mt | grep "Total" | awk -F' ' '{print $4}')

THRESHOLD=500

if [[ $FREE_SPACE -lt $THRESHOLD ]]
then
    echo "WARNING: RAM is running low."
else
    echo "RAM space is sufficient - $FREE_SPACE M"
fi