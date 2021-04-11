#!/usr/bin/env bash

trial() {
	echo "This is a trial"
}

create_toybin() {
	# .toybin directory doesn't exist; create it
	echo "Creating Toybin directory."
	mkdir /home/$USER/.toybin/
}

check_init_status() {
	# check for /home/$USER/.toybin directory
	if [ -d "/home/$USER/.toybin/" ]
	then
		# .toybin directory exists
		echo "Toybin initialized."
	else
		create_toybin
	fi
}

get_contents() {
	files=$(ls)
	for f in $files
	do
		echo "$f" | cut -d "." -f2
	done
}

create_toybin
