#!/bin/bash

FOLDER=$(dirname $0)
pushd $FOLDER/../
rm -rf src/static/*
docker run --rm -it --net host -u $UID -v $(pwd)/src/:/webapp -w /webapp/frontend node:latest npm run build
popd