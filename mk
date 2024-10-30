#!/bin/bash

# Define data
file=$1
ext="${file##*.}"
fname=$"${file%.*}"
in=$2
out=$3
args=$#

# Functions #

## Compile code ##

compC ()
{
	gcc -o $fname $file -lm
}

compCpp ()
{
	g++ -o $fname $file -lm
}

compJava ()
{
	javac $file
}

## Run compiled code ##

runC ()
{
	if [ -z "$in" ] && [ -z "$out" ]; then
		./$fname 

	elif [ -z "$out" ]; then
		./$fname <$in

	elif [ -z "$in" ]; then
		./$fname >$out
	
	else
		./$fname <$in >$out
	
	fi
}

runJava ()
{
	if [ -z "$in" ] && [ -z "$out" ]; then
		java $fname 

	elif [ -z "$out" ]; then
		java $fname <$in

	elif [ -z "$in" ]; then
		java $fname >$out
	
	else
		java $fname <$in >$out
	
	fi
}

## Define input and output ##
defArgs ()
{
	if [ $args == 2 ]; then
		
		local tmp=$"${in##*.}"

		if [ $tmp == "out" ]; then
			out=$in;
			in=""
		fi
	fi
}

# Compile & run code

defArgs

if [ "$ext" == "$fname" ]; then
	echo "ERROR: No file extension was given!"

elif [ $# == 0 ]; then
	echo "ERROR: No parameters where given!"

elif [ $ext == 'c' ]; then
	compC
	runC

elif [ $ext == 'cpp' ]; then
	compCpp
	runC

elif [ $ext == 'java' ]; then
	compJava
	runJava

fi
