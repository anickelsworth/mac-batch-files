#This procedure is about creating a ISO image file from CD/DVD using the command line on a Mac OS X

DiskId=$(drutil status |grep -m1 -o '/dev/disk[0-9]*' | cut -c6-)

if [ -z "$DiskId" ]; then
   echo "No Media Inserted" 
else 
   voldisk=`df | grep "$DiskId" |grep -o /Volumes.* | sed -e 's/ /_/g'`
   echo $voldisk

   DiskNm=`echo $voldisk | cut -c10-`
   echo $DiskNm
   echo $DiskId

   #Unmount the disk to proceed
   diskutil unmountDisk $DiskId

   #Create the ISO file
   dd if=/dev/$DiskId of=~/Desktop/$DiskNm.iso  bs=2048

   #Remount the disk
   diskutil mountDisk $DiskId

   echo "DONE CONVERTING FILES. Press enter to continue"
fi

read dummyEnter
