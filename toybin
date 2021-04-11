#!/usr/bin/env bash

create_toybin() {
	# .toybin directory doesn't exist; create it
	echo "Creating ToyBin directory."
	mkdir /home/$USER/.toybin/
}

sort_files() {
	files=$(ls)
	for f in $files
	do
		ext=$(echo "$f" | cut -d "." -f2)
		if [ ! -d "/home/$USER/.toybin/$ext" ]
		then
			# create a new file for the extension type
			mkdir /home/$USER/.toybin/$ext
			# move the file to the directory
			mv $f /home/$USER/.toybin/$ext/$f
		else
			# move the file to the directory
			mv $f /home/$USER/.toybin/$ext/$f
		fi
	done
}

check_init_status() {
	# check for /home/$USER/.toybin directory
	if [ -d "/home/$USER/.toybin/" ]
	then
		# .toybin directory exists
		sort_files
	else
		create_toybin
	fi
}

check_init_status
