#hdiutil convert -format UDRW -o ~/Desktop/Ubuntu_amd64.img ~/Desktop/ubuntu-15.10-desktop-amd64.iso

diskutil list

diskutil unmountDisk /dev/disk2

sudo dd if=/Users/DavidMac/Desktop/Win10_1803_English_x32.iso of=/dev/disk2 bs=1m

diskutil eject /dev/disk2
