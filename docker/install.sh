#!/usr/bin/env sh
DOCKERDEFAULT="$(docker-machine ls | grep default)"
if [ "$?" != "0" ]
then
  docker-machine create --driver virtualbox default
fi
