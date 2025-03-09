#/bin/bash

FOLDER=$(dirname $0)
pushd $FOLDER/../
go run src/*.go
popd