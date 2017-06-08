#!/usr/bin/env bash

# browser-sync start --server build --files build/* --port 3000 --reload-delay 100 &

ARTIFACT_PATH=./out/artifacts/spring_npm_frontend_boilerplate_war_exploded/

#watchify ./frontend/app/app.js -t [babelify] --debug -o ${ARTIFACT_PATH}app.js -v &
# call watchify from ./frontend, because babelify can't resolve "babelify" plugin otherwise
sh ./frontend/watchify-artifact.sh &

while true; do cp -u ./frontend/app/*.html ${ARTIFACT_PATH}; sleep 2; done &
browser-sync start --proxy http://localhost:8080 --files ${ARTIFACT_PATH}* --port 3000 --reload-delay 100 &

wait