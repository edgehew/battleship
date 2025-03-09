#!/bin/bash

FOLDER=$(dirname $0)
pushd $FOLDER/../
docker run --rm -it --net host -u $UID -v $(pwd)/src/frontend:/webapp -w /webapp node:latest npm install 
docker run --rm -it --net host -u $UID -v $(pwd)/src/frontend:/webapp -w /webapp node:latest npm run format
docker run --rm -it --net host -u $UID -v $(pwd)/src/frontend:/webapp -w /webapp node:latest npm run dev
popd