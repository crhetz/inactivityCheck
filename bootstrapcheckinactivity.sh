#!/bin/bash

# if plist is installed while a user is logged in we have to restart the service
# else, the service will be started automatically by the system when the user logs in.

currentUser=$(stat -f%Su /dev/console)
uid=$(id -u $3)
path=/Library/LaunchAgents/com.checkinactivity.plist

if [ $currentUser != "root" ]; then
	launchctl bootstrap gui/$uid $path
fi