#!/bin/sh

currDir=`pwd`
inDir="/Users/DavidMac/Desktop/MoviesToConvert"
hbcli=/Applications/HandBrakeCLI
input_file_type="mov"
output_file_type="m4v"

# Convert from one file to another
convert() {
# The beginning part, echo "" | , is really important. Without that
# HandBrake exits the while loop.
   echo ""# | $hbcli -i "$1" -o "$2" --preset="AppleTV 3";
}

echo "# Using HandBrakeCLI at "$hbcli

cd $inDir

# Find the files and pipe the results into the read command
# because the read command properly handles spaces in directories and files names.
find "$inDir" -name '*.mov' | while read in_file
do
  echo "Processing file..."
  echo ">Input "$in_file

  # Replace the file type
  out_file=$(echo $in_file|sed "s/\(.*\.\)$input_file_type/\1$output_file_type/g")
  echo ">Output "$out_file

  # Convert the file
  convert "$in_file" "$out_file"

done

echo -en "\007"
echo -en "\007"
echo -en "\007"
echo "DONE CONVERTING FILES. Press enter to continue"
read dummyEnter

cd $currDir
