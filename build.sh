#!/usr/bin/env bash

echo -e "This script will build RedHat VDO for Tiny Core:10.0-x86_64 (Kernel: 4.19.10-tinycore64)\n"

VDO_VERSION=$1

if [ "${VDO_VERSION}" = "" ]; then
   echo -n "Enter the VDO version number to build [ex: 6.2.1.134]: "
   read VDO_VERSION
fi

if [ "${VDO_VERSION}" = "" ]; then
   VDO_VERSION="6.2.1.134"
fi

docker build -t vdo-build .
docker run --volume "$(pwd):/opt/build" --cidfile=containerid  -u root vdo-build sh -c "/opt/build/build-vdo.sh ${VDO_VERSION}"

CONTAINER_ID=$(cat containerid)
docker cp ${CONTAINER_ID}:/vdo.tcz ./
docker rm -f ${CONTAINER_ID}
rm containerid
