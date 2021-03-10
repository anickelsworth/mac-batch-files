#networksetup -setairportnetwork en1 PeatNet IWantMyMommy!

sudo mkdir /Volumes/PeatFam2TB
sudo mount -t smbfs //PeatFamily:InOurHouse@192.168.2.15/PeatFamily /Volumes/PeatFam2TB
#sudo rsync -av --exclude ".DS_Store" /Users/DavidMac/Pictures /Volumes/PeatFam2TB/David\ MacBook > /Users/DavidMac/Desktop/RsyncPictures.txt
sudo rsync -av --exclude ".DS_Store" /Users/DavidMac/Music/iTunes/iTunes\ Media/Music /Volumes/PeatFam2TB/David\ MacBook > /Users/DavidMac/Desktop/RsyncOut.txt
diskutil unmount /Volumes/PeatFam2TB

#networksetup -setairportnetwork en1 PeatMiFi IWantMyMommy!
