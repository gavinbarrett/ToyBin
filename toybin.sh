#!/usr/bin/env bash

create_toybin() {
	# .toybin directory doesn't exist; create it
	echo "Creating ToyBin directory."
	mkdir "$HOME/.toybin/"
}

sort_files() {
	# sort all files in the current directory
	cd $HOME
	files=$(ls)
	for f in $files
	do
		# FIXME: add a .toybinignore file to ignore specific files
		if [ -d "$HOME/$f" ] || [[ $f == "toybin.sh" ]]
		then
			continue
		else
			ext=$(echo "$f" | cut -d "." -f2)
			if [ ! -d "$HOME/.toybin/$ext" ]
			then
				# create a new file for the extension type
				mkdir "$HOME/.toybin/$ext"
			fi
			# move the file to the directory
			mv $f "$HOME/.toybin/$ext/$f"
		fi
	done
}

init_toybin() {
	# check for /home/$USER/.toybin directory
	if [ ! -d "$HOME/.toybin/" ]
	then # initialize a toybin directory
		create_toybin
	fi # sort ~/ homes
	sort_files
}

init_toybin
