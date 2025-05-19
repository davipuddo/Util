#!/bin/bash

ext=$1
cur=false # current directory
sub=false # directories 1 level below

f=(*.${ext}) 		# Look for files in current dir
df=(./*/*.${ext})	#     ==         in subdirectories

readDelete()
{
	printf "\nDo you want to delete the given files?\n[Y\N]\n"

	read x

	if [ $x == "Y" ] || [ $x == "y" ]; then # Delete files
		rm *.${ext}
		recurse
		echo "The files were deleted."

	elif [ $x == "n" ] || [ $x == "N" ] ; then # Abort

		echo "Aborting script."

	else # Retry 

		printf "ERROR: Invalid input!\n\n"
		readDelete
	fi
}

recurse()
{
	if [ -f "${df[0]}" ]; then
		echo "sim"	
	fi
}

if [ $# != 1 ]; then # Check parameters

	echo "ERROR: Invalid parameters!"
	echo "Use: rex [extension]"

else

	ls -R *.{$ext}

	if [ -f "${f[0]}" ]; then # current
		printf "current: "
		cur=true
	fi

	if [ -f "${df[0]}" ]; then # current
		printf "current: "
		sub=true
	fi

	if [ "$cur" = true ] || [ "$sub" = true ]; then
		readDelete
	else
		echo "ERROR: No file '.${ext}' was found!"
	fi
fi
