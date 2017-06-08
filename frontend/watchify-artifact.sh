#!/usr/bin/env bash

# set current directory to ./frontend explicitly, because this script gets executed from a root project dir
cd "${0%/*}"

watchify app/app.js -t [babelify] --debug -o ./../out/artifacts/spring_npm_frontend_boilerplate_war_exploded/app.js -v