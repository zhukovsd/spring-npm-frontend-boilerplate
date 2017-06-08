#!/usr/bin/env bash

mkdir -p ./build/
cp ./app/*.html ./build/

./node_modules/.bin/browserify app/app.js -t [babelify] --debug -o build/app.js