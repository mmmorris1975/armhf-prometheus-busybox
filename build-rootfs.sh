#!/bin/bash

NAME=armhf-prom-busybox
IMAGE=${NAME}-rootfs

docker build -t ${IMAGE}:latest -f Dockerfile.builder .
docker run -d --name ${NAME} ${IMAGE}:latest
docker cp ${NAME}:/rootfs/ rootfs

cd rootfs
tar cJf ../rootfs.tar.xz *
cd -
rm -rf rootfs

docker stop ${NAME}
docker rm ${NAME}
docker rmi ${IMAGE}
