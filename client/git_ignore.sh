#!/usr/bin/env bash
if [ -z "$1" ]; then
    git rm -r --cached "$1"/      # Remove a directory and its contents
    git commit -m "Add $1 .gitignore"
    git push origin main
else
    echo "need folder name as argument"
fi

