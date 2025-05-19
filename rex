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
		recurseDelete
		echo "The files were deleted."

	elif [ $x == "n" ] || [ $x == "N" ] ; then # Abort

		echo "Aborting script."

	else # Retry 

		printf "ERROR: Invalid input!\n\n"
		readDelete
	fi
}

recurseFind()
{
	if [ -f "${df[0]}" ]; then
		
		echo "Sub: "
		for i in */*.$ext;
		do
			eza "$i";
		done
		echo ""
		sub=true
	fi 
}

recurseDelete()
{
	if [ -f "${df[0]}" ]; then
		
		for i in */*.$ext;
		do
			rm "$i";
		done
	fi 
}

if [ $# != 1 ]; then # Check parameters

	echo "ERROR: Invalid parameters!"
	echo "Use: rex [extension]"

else

	if [ -f "${f[0]}" ]; then # current
		echo "Current: "
		eza *.$ext
		echo ""
		cur=true
	fi

	recurseFind

	if [ "$cur" = true ] || [ "$sub" = true ]; then
		readDelete
	else
		echo "ERROR: No file '.${ext}' was found!"
	fi
fi
