#!/bin/bash
#echo 'wepie@201803' | sudo -S xcode-select -s /Applications/Xcode11.7.app/Contents/Developer
function runCmdOnDevice() # args: command message
{
	local command="$1"
	local message="$1"
	local final="$1"
    local MonkeyDevDevicePassword=alpine
    echo "sdfsdf"
	if [[ "$MonkeyDevDevicePassword" != "" ]]; then
		final="sshpass -p $MonkeyDevDevicePassword $command"
	fi
    echo $final

	eval "$final" || \
		panic $? "$message"
}
hostPort=2222
hostAddress=localhost
targetDir=/var/root/MonkeyDevPackages
runCmdOnDevice "ssh -p$hostPort root@$hostAddress mkdir -p \"$targetDir\"" "Failed to create directory $targetDir on device $hostAddress"



