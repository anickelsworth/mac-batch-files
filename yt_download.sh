#!/bin/sh

echo "Enter the YouTube link: "; read videolink

youtube-dl -f mp4 $videolink
