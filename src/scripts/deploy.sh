#!/usr/bin/env bash

ls -la ./
ssh-keyscan -H "$1" >> ~/.ssh/known_hosts
ssh "deploy@${1}" "rm -f ~/frontenv/*"
scp -r ./dist/static "deploy@${1}:~/frontend/"
scp ./dist/index.html "deploy@${1}:~/frontend/"
scp ./dist/service-worker.js "deploy@${1}:~/frontend/"

