
echo "Start backup process" > ~/Desktop/RsyncOut.txt

DEST='/Volumes/WDPASS320'

SRC='/Users/DavidMac/Movies'
#SRC='/Users/DavidMac/Music /Users/DavidMac/Pictures /Users/DavidMac/Documents'
echo "Backing up $SRC to $DEST"
sudo rsync -av --exclude ".DS_Store" --exclude ".AppleDouble" $SRC "$DEST" >> ~/Desktop/RsyncOut.txt

#SRC='/Users/DavidMac/Movies'
#echo "Backing up $SRC to $DEST"
#sudo rsync -av --delete --exclude ".DS_Store" --exclude ".AppleDouble" "$SRC" "$DEST" >> ~/Desktop/RsyncOut.txt

#sudo rsync -av --dry-run --delete --exclude ".DS_Store" --exclude ".AppleDouble" "$SRC" "$DEST" > ~/Desktop/RsyncOut.txt

#diskutil unmount /Volumes/PeatFam2TB

#grep "\.m" ~/Desktop/RsyncOut.txt | grep -v delet > ~/Desktop/RsyncCopied.txt
grep "delet" ~/Desktop/RsyncOut.txt > ~/Desktop/RsyncDeletes.txt
grep -v '/$' ~/Desktop/RsyncOut.txt > ~/Desktop/RsyncFiles.txt

#rm -f ~/Desktop/RsyncOut.txt

#networksetup -setairportnetwork en1 PeatMiFi IWantMyMommy!
#SRC='/prod/user/sam/us/card/ccm/proj3/npi'
#DEST='/prod/user/sam/us/card/ccm/npi/DMC'
#rsync -avn --dry-run --delete $SRC/ $DEST/ |grep "delet"

#sudo rsync -av --delete --exclude ".DS_Store" /Users/DavidMac/Music/iTunes/iTunes\ Media/Music /Volumes/PeatFam2TB/David\ MacBook > ~/Desktop/RsyncOut.txt
#sudo rsync -av --dry-run --delete --exclude ".DS_Store" "$SRC/" "$DEST/" > ~/Desktop/RsyncOut.txt

#pause
