#!/bin/bash

cd /home/ubuntu/simple-nodejs-app
npx kill-port 4000 -y
node server.js &
