#!/usr/bin/bash
# Download youtube video with desired quality

# youtube-dl accepts both fully qualified URLs and video id's such as AQcQgfvfF1M
# https://askubuntu.com/questions/486297/how-to-select-video-quality-from-youtube-dl

url="$*"

echo "Fetching available formats for $url..."
youtube-dl -F "$url"
read -p "Please enter the desired quality code: " FORMAT

echo "Streaming with quality $FORMAT..."
youtube-dl -f$FORMAT $url
mpv --cache=auto $(youtube-dl -f $FORMAT -g "$url")
