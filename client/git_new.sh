#!/usr/bin/env bash
if [ -z "$1" ]; then 
    echo "you need to provide the repo name"
else 
    git init
    git add .
    git commit -am "first commit"
    git remote add origin https://github.com/pannet1/$1.git
    git branch -M main
    git push -u origin main
fi
