#!/bin/bash
inactiveTime=$(expr $(ioreg -c IOHIDSystem | awk '/HIDIdleTime/{print $NF; exit}') / 1000000000)
tmpDir=/.Sav3d
mkdir -p $tmpDir

if [ $inactiveTime -gt 60 ];then
	# If this is not the admin user...
	if [ "$3" == "Guest" ];then

##   	compress user folder
		tar -cPf /.Sav3d/"$3"_$(date +%H.%M-%m.%d.%y).tar ~/Desktop ~/Documents ~/Downloads

## 		remove home folder
	#rm -Rf /Users/$guest


##		remove files in tmpDir a week old
		find $tmpDir -type f -mtime +7 -exec rm -f {} \;

		rm -Rf /Users/$3
	fi

	osascript -e 'ignoring application responses' -e 'tell application "loginwindow" to «event aevtrlgo»' -e end
else
	exit 0
fi
