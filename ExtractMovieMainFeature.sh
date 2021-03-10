#!/usr/bin/env bash

# sh /Users/davidmac/Documents/Batch\ Files/ExtractMovieMainFeature.sh

# Assign Variable for Handbrakes Command-Line Interface (HBCLI)
hbcli=/Applications/HandBrakeCLI

# Extract the DVD device and volume name
id=$(drutil status |grep -m1 -o '/dev/disk[0-9]*')
if [ -z "$id" ]; then
    echo "No Media Inserted"
else
    volfixed=`df | grep "$id" |grep -o /Volumes.* | sed -e 's/ /_/g'`
    voldisk=`df | grep "$id" |grep -o /Volumes.*`
fi

DiskNm=`echo $volfixed | cut -c10-`
echo $DiskNm
MovieName=`echo $DiskNm | awk '{print toupper(substr($1,1,1)) tolower(substr($1,2))}' | sed -e 's/_/-/g'`
echo $MovieName

# Create a directory to hold the resulting movie files
OutDir=~/Desktop
if [ -d "$OutDir" ]; then
  echo "Directory $OutDir exists"
else
  echo "Cannot write to $OutDir"
fi

# Using HBCLI, extract the main feature track to a file
$hbcli -i "$voldisk" --main-feature --preset="Fast 1080p30" -o "$OutDir/$MovieName.m4v" --subtitle "none"

drutil tray eject
