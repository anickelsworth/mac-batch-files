#!/usr/bin/env bash

echo "Movie to copy: "; read moviename

scp "$moviename" dpeat@192.168.0.28:"'/media/NAS2TB/Full-Length Movies'"
