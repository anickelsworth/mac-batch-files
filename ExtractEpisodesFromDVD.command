#!/usr/bin/env bash

# sh /Users/davidmac/Documents/Batch\ Files/ExtractEpisodesFromDVD.command

# Assign Variable for Handbrakes Command-Line Interface (HBCLI)
hbcli=/Applications/HandBrakeCLI

echo "Enter the Season number: "; read SeasNum
echo "Enter the Disk number: "; read InDiskNum

# Extract the DVD device and volume name
id=$(drutil status |grep -m1 -o '/dev/disk[0-9]*')
if [ -z "$id" ]; then
    echo "No Media Inserted"
else
    volfixed=`df | grep "$id" |grep -o /Volumes.* | sed -e 's/ /_/g'`
    voldisk=`df | grep "$id" |grep -o /Volumes.*`
fi

DiskNm=`echo $volfixed | cut -c10-`
DiskNm=$DiskNm"_Season"$SeasNum"_Disk"$InDiskNum
echo $DiskNm

# Create a directory to hold the resulting movie files
OutDir=~/Movies/$DiskNm
if [ -d "$OutDir" ]; then
  echo "Directory $DiskNm exists"
else
  mkdir ~/Movies/$DiskNm
fi

# Using HBCLI, extract all the useable track information to a file
$hbcli -i "$voldisk" -t0  2> ~/Temp/CLI_Tracks.txt

# Search through the file to find all the TRACK identifiers in the file
grep "+ title" ~/Temp/CLI_Tracks.txt > ~/Temp/CLI_Track2.txt

while read line
   do
      TrackNum=`echo -e "$line" | cut -c9- | tr -d title:`
      TrackNum=`echo "$TrackNum" | awk '{$1=$1};1'`
      # The beginning part, echo "" | , is really important. Without that, HandBrake exits the while loop.
      echo ""# | $hbcli -i "$voldisk" -t $TrackNum --preset="Fast 720p30" -o $OutDir/Title$TrackNum.m4v
   done < ~/Temp/CLI_Track2.txt

drutil tray eject
