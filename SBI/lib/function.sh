#!/bin/bash
DIR=$(dirname $0)
export USERID=$(id -u)
export GROUPID=$(id -g)
function version() {
docker-compose -f $DIR/test-bed.yml run --rm -w "$WORKSPACE" --name maven-${BUILD_NUMBER} --entrypoint "SBI/version.sh" maven-app-build
}

function pom_version() {
python $DIR/version.py
}
