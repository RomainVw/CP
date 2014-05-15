#!/bin/bash

VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
JAUNE="\\033[1;33m"
CYAN="\\033[1;36m"
delimiter=$(echo -e $BLEU"-------------------------------------------------------------------------------------"$NORMAL)

function advertise() {
    echo -e $delimiter
    echo -e $1
    echo -e $delimiter
}

function search_values() {
	local_timeout=$1;
	version=$2;	
	lb=1;
	ub=25;
	try=$(( ($ub+$lb)/2 ));
	echo -e $ROSE"Trying with "$try" for "$local_timeout"s (program version="$version")"$NORMAL
	./timeout.sh -t $local_timeout r=$($version $try);
	echo $r | grep "Solution :" | awk '{print $2}'
}

local_timeout=0;
version=2;

while getopts "t:v:" opt; do
	case "$opt" in
    	t) local_timeout=$OPTARG ;;
		v) version=$OPTARG ;;
	esac
done
advertise $ROUGE"launching the program (v"$version") with "$local_timeout" for each try"$NORMAL;

program=./VRPTW;
case "$version" in 
	1) program=./VRPTW.co;;
	2) program=./VRPTW_v2.co;;
esac

search_values $local_timeout $program;