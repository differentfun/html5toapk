#!/bin/bash

pkexec bash <<EOF
apt update
apt install -y nodejs npm default-jdk gradle imagemagick zenity
npm install -g cordova
EOF
