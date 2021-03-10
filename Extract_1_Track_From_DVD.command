# Assign Variable for Handbrakes Command-Line Interface (HBCLI)
hbcli=/Applications/HandBrakeCLI

echo "Enter the Track number: "; read TrackNum

# Extract the DVD device and volume name
id=$(drutil status |grep -m1 -o '/dev/disk[0-9]*')
if [ -z "$id" ]; then
    echo "No Media Inserted" 
else 
    voldisk=`df | grep "$id" |grep -o /Volumes.*`
fi
DiskNm=`echo "$voldisk" | cut -c10-`
#DiskNm=$DiskNm"_Season"$SeasNum"_Disk"$InDiskNum
echo $DiskNm

# Create a directory to hold the resulting movie files
OutDir=~/Desktop/Converted\ Videos
if [ -d "$OutDir" ]; then
  echo "Directory ""$OutDir"" exists"
else
  mkdir ~/Movies/$DiskNm
fi

# Using HBCLI, extract all the useable track information to a file
$hbcli -i "$voldisk" -t0  2> ~/Temp/CLI_Tracks.txt

#$hbcli -i "$voldisk" -t 0 --min-duration=360  2> ~/Temp/CLI_Tracks.txt


# Search through the file to find all the TRACK identifiers in the file
grep "+ title" ~/Temp/CLI_Tracks.txt > ~/Temp/CLI_Track2.txt
cat ~/Temp/CLI_Track2.txt

while read line
   do
      TrackNo=`echo -e "$line" | cut -c9- | tr -d title:`
      # The beginning part, echo "" | , is really important. Without that, HandBrake exits the while loop.
      if [ $TrackNo -eq $TrackNum ]; then
         echo Track $TrackNo found
         echo ""# | $hbcli -i "$voldisk" -t $TrackNum --preset="AppleTV 3" -o "$OutDir"/Title$TrackNum.m4v
      fi
   done < ~/Temp/CLI_Track2.txt
