hbcli=/Applications/HandBrakeCLI
OutDir=~/Movies/TRUE_U_BIBLE_DVD_2
voldisk='/Volumes/Public/MyVideos/DVD Images/True U - Is The Bible Reliable/TRUE_U_BIBLE_DVD_2.iso'

if [ -d "$OutDir" ]; then
  echo "Directory Already exists"
else
  mkdir "$OutDir"
fi

$hbcli -i "$voldisk" -t0  2> ~/Temp/CLI_Tracks.txt
#cat ~/Temp/CLI_Tracks.txt

# Search through the file to find all the TRACK identifiers in the file
grep "+ title" ~/Temp/CLI_Tracks.txt > ~/Temp/CLI_Track2.txt

while read line
   do
      TrackNum=`echo -e "$line" | cut -c9- | tr -d title:`
      # The beginning part, echo "" | , is really important. Without that, HandBrake exits the while loop.
      echo ""# | $hbcli -i "$voldisk" -t $TrackNum --preset="AppleTV 3" -o $OutDir/Title$TrackNum.m4v
   done < ~/Temp/CLI_Track2.txt
