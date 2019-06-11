#!/bin/bash
DIR=$(dirname $0)
function version() {
docker-compose -f $DIR/test-bed.yml run --rm -w "$WORKSPACE" --name maven-${BUILD_NUMBER} --entrypoint "SBI/version.sh" maven-app-build
}


