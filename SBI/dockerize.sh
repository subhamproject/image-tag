#!/bin/bash
export PATH="$PATH:/usr/local/bin"
#docker-compose build maven-app-image-docker
case $BRANCH_NAME in
  qa)
   if [ -n "$(echo $BRANCH_NAME|grep '[a-zA-Z]')" ];then
    tag="$BUILD_ID-$(cat pom.xml |grep '<version>'|head -1|sed 's|<version>||; s|</version>||')"
    dockerfile=Dockerfile.develop
    fi
    ;;
  develop)
  if [ -n "$(echo $BRANCH_NAME|grep '[a-zA-Z]')" ];then
    tag="$BUILD_ID-$(cat pom.xml |grep '<version>'|head -1|sed 's|<version>||; s|</version>||')"
    dockerfile=Dockerfile.develop
    fi
    ;;
  master)
  if [ -n "$(echo $BRANCH_NAME|grep '[a-zA-Z]')" ];then
   tag="$BUILD_ID-$(cat pom.xml |grep '<version>'|head -1|sed 's|<version>||; s|</version>||')"
   dockerfile=Dockerfile.prod
   fi
    ;;
  *)
  echo $BRANCH_NAME
    tag="$BUILD_ID-$(cat pom.xml |grep '<version>'|head -1|sed 's|<version>||; s|</version>||')"
    dockerfile=Dockerfile.develop
esac

services=$(cat $(dirname $0)/service-manifest.txt)
for s in $services
do
docker build -t ${s}:${tag}  -f $(dirname $0)/docker/$dockerfile .
done
