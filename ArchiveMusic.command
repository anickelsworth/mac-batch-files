#networksetup -setairportnetwork en1 PeatNet IWantMyMommy!

#Stop .AppleDouble files from being created on the Windows Drive
#defaults write com.apple.desktopservices DSDontWriteNetworkStores true

#sudo mkdir /Volumes/PeatFam2TB
sudo mount -t smbfs //PeatFamily:InOurHouse@192.168.0.102/PeatFamily /Volumes/PeatFam2TB

SRC='/Users/DavidMac/Music/iTunes/iTunes Media/Music'
DEST='/Volumes/PeatFam2TB/David MacBook'
echo $SRC $DEST

#sudo rsync -av --dry-run --delete --exclude ".DS_Store" --exclude ".AppleDouble" "$SRC" "$DEST" > ~/Desktop/RsyncOut.txt
sudo rsync -av --delete --exclude ".DS_Store" --exclude ".AppleDouble" "$SRC" "$DEST" > ~/Desktop/RsyncOut.txt

diskutil unmount /Volumes/PeatFam2TB

grep "\.m" ~/Desktop/RsyncOut.txt | grep -v delet > ~/Desktop/RsyncCopied.txt
grep "delet" ~/Desktop/RsyncOut.txt > ~/Desktop/RsyncDeletes.txt

#rm -f ~/Desktop/RsyncOut.txt

#networksetup -setairportnetwork en1 PeatMiFi IWantMyMommy!
#SRC='/prod/user/sam/us/card/ccm/proj3/npi'
#DEST='/prod/user/sam/us/card/ccm/npi/DMC'
#rsync -avn --dry-run --delete $SRC/ $DEST/ |grep "delet"

#sudo rsync -av --delete --exclude ".DS_Store" /Users/DavidMac/Music/iTunes/iTunes\ Media/Music /Volumes/PeatFam2TB/David\ MacBook > ~/Desktop/RsyncOut.txt
#sudo rsync -av --dry-run --delete --exclude ".DS_Store" "$SRC/" "$DEST/" > ~/Desktop/RsyncOut.txt
