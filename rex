#!/bin/bash

EXT=$1
PC=$#
MATCHES=""

menu()
{
	printf "\nDo you want to delete the given files?\n[Y\N]\n"

	read x

	if [ "$x" == "Y" ] || [ "$x" == "y" ]; then
		rm $MATCHES
	elif [ "$x" == "N" ] || [ "$x" == "n" ]; then
		echo "Aborting script!"
	else
		echo "ERROR: Invalid input!"
		menu
	fi
}

if [ ! $EXT ]; then
	echo "ERROR: Invalid parameters!"	
else

	MATCHES=$(find . -type f | grep -w ".*\.$EXT")

	if [ "$MATCHES" == "" ]; then
		echo "No matches were found!"
	else
		echo "Matches: "
		eza --icons=always $MATCHES
		menu
	fi
fi
