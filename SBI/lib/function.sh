#!/bin/bash

function version() {
docker-compose -f test-bed.yml run --rm -w "$WORKSPACE" --name maven-${BUILD_NUMBER} --entrypoint "SBI/version.sh" maven-app-build
}


