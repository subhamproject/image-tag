#!/bin/bash
mvn --non-recursive help:evaluate -Dexpression='project.version' | grep -v '\[.*'|grep -v 'Downloading'
