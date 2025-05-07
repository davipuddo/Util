#!/bin/bash

ext=$1
cur=false # current directory
sub=false # directories 1 level below

readDelete()
{
	printf "\nDo you want to delete the given files?\n[Y\N]\n"

	read x

	if [ $x == "Y" ] || [ $x == "y" ]; then # Delete files
		rm *.${ext}
		rm ./*/*.${ext}
		echo "The files were deleted."

	elif [ $x == "n" ] || [ $x == "N" ] ; then # Abort

		echo "Aborting script."

	else # Retry 

		printf "ERROR: Invalid input!\n\n"
		readDelete
	fi
}

if [ $# != 1 ]; then # Check parameters

	echo "ERROR: Invalid parameters!"
	echo "Use: rex [extension]"

else

	f=(*.${ext}) 		# Look for files in current dir
	df=(./*/*.${ext})	#     ==         in subdirectories

	if [ -f "${f[0]}" ]; then # current
		printf "current: "
		ls *.${ext}
		cur=true
	fi

	if [ -f "${df[0]}" ]; then # sub
		printf "sub: "
		ls ./*/*.${ext}
		sub=true
	fi

	if [ "$cur" = true ] || [ "$sub" = true ]; then
		readDelete
	else
		echo "ERROR: No file '.${ext}' was found!"
	fi
fi
