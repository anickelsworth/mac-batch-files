#sh ~/Documents/Batch\ Files/CopyFromExternalDrive.sh

RemoteDir="MyVideos"
LocalDir="/Users/DavidMac/Desktop/MoviesToConvert"
ResultsFile="/Users/DavidMac/Desktop/RsyncOut.txt"

sudo mkdir /Volumes/PeatFam2TB
sudo mount -t smbfs //PeatFamily:InOurHouse@192.168.2.15/Public /Volumes/PeatFam2TB

sudo rsync -av --exclude ".DS_Store" --exclude "*.iso" /Volumes/PeatFam2TB/"$RemoteDir" $LocalDir > $ResultsFile
#sudo rsync -av --exclude ".DS_Store" /Volumes/PeatFam2TB/My\ DVDs /Users/DavidMac/Desktop/MoviesToConvert > /Users/DavidMac/Desktop/RsyncOut.txt

cd $LocalDir
sudo chmod -R 777 $RemoteDir

diskutil unmount /Volumes/PeatFam2TB

#grep "\.m" /Users/DavidMac/Desktop/RsyncOut.txt > /Users/DavidMac/Desktop/RsyncOut1.txt
