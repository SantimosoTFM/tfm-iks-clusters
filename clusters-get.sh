#!/bin/bash
#set -x

REGIONS_FILE="./regions"
REGION="eu-de"


### Login at IBM Cloud

bx config --check-version=false
bx login --apikey @santier-ibmcloud-key.json -a https://api.$REGION.bluemix.net 

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "> Set region to: $line"
    bx cs region-set $line
    bx cs cluster-get --cluster "mycluster" 
done < "$REGIONS_FILE"
