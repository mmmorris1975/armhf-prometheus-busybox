#!/bin/bash

NAME=$(basename $(dirname $PWD/Dockerfile))

docker build -t ${NAME}:latest .
