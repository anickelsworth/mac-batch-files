
echo "Start backup process" > ~/Desktop/RsyncOut.txt

DEST='/Volumes/DP-GoFlex'

SRC='/Users/DavidMac'
#SRC='/Users/DavidMac/Music /Users/DavidMac/Pictures /Users/DavidMac/Documents'
echo "Backing up $SRC to $DEST"
sudo rsync -av --exclude ".DS_Store" --exclude ".AppleDouble" $SRC "$DEST" >> ~/Desktop/RsyncOut.txt

#grep "\.m" ~/Desktop/RsyncOut.txt | grep -v delet > ~/Desktop/RsyncCopied.txt
grep "delet" ~/Desktop/RsyncOut.txt > ~/Desktop/RsyncDeletes.txt
grep -v '/$' ~/Desktop/RsyncOut.txt > ~/Desktop/RsyncFiles.txt

#rm -f ~/Desktop/RsyncOut.txt
