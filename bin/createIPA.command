#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ${DIR} = "/opt/MonkeyDev/bin" ]]; then 
	DIR="$PWD"
fi

function run {
	echo "Executing command: $@"
	$@
	if [[ $? != "0" ]]; then
		echo "Executing the above command has failed!"
		exit 1
	fi
}

function run_at {
	pushd $1
	shift
	run $@
	popd
}

# down is right
echo "==================MonkeyDev(create ipa file...)=================="

run "rm -rf Target.ipa Payload"
run "mkdir Payload"

APP=$(find . -type d | grep ".app$" | head -n 1)

run "cp -rf ${APP} Payload"
run_at . "zip -qr Target.ipa Payload"
run "rm -rf Payload"

echo "==================MonkeyDev(done)=================="