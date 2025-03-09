#!/bin/bash

FOLDER=$(dirname $0)
pushd $FOLDER/../
docker run -u 1000 --rm -it --net host -v $(pwd)/src/:/webapp -w /webapp node:latest npm create vue@latest
popd