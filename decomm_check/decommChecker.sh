#!/bin/bash

#Command Line arguments goes here

outfile=$1
decommhost=$2

#Condition checks goes here

function usage()
{
	echo "Usage: decommChecker.sh <output filename> < IP of host to be decommissioned:5660>"
	exit 1;
}


if [ -z "$outfile" ];then
	usage
fi


#Execution starts here

echo "Volumes present on the target node" >> $outfile

for volume  in `maprcli volume list -columns volumename`;
do 
	echo $volume >>$outfile
	maprcli dump volumenodes -volumename $volume -json | grep -i "$decommhost"; >>$outfile
done;
