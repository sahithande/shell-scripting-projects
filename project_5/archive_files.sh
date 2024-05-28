#!/bin/bash
#############################
# Owner: sahithande
# Date: 28th-may
# Version: v1
#
#############################

BASE=/home/sahithande/
DEPTH=1
RUN=0

# Check if the directory is present or not
if [[ ! -d $BASE ]]
then
    echo "Directory doesn't exist: $BASE"
    exit 1
fi

# Create archive folder of not present
if [[ ! -d $BASE/archive ]]
then    
    mkdir $BASE/archive
fi

# Find the list of files larger than 1GB
for i in `find $BASE -maxdepth $DEPTH -type f -size +1G`
do  
    if [[ $RUN -eq 0 ]]
    then
        gzip $i || exit 1
        mv $i.gz $BASE/archive || exit 1
done
