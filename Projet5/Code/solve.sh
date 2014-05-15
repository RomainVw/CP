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

function wait_and_kill() {
    sleep $1
    kill $2 2>/dev/null
}

function search_values() {
	local_timeout=$1;
	version=$2;
	instance=$3;
	lb=1;
	ub=25;
	try=$(( ($ub+$lb)/2 ));
	
	while [ "$try" -ne "$ub" ]
	do
		try=$(( ($ub+$lb)/2 ));
		echo -e $ROSE"Trying with "$try" for "$local_timeout"s (program version="$version")"$NORMAL
		
		/Applications/Comet/comet.app/Contents/MacOS/comet $version $instance $try > output 2>/dev/null &
		
		pid=$!
		wait_and_kill $local_timeout $pid &
		wait $pid

		found_solution=$(( $(cat output |grep "Solution : " |awk '{print $3}') ))
		
		if [ $found_solution -gt 0 ]
		then
			#success
			ub=$(( $found_solution - 1 ));	
			last_solution=$found_solution		
		else
			#fail
			lb=$(( $try + 1 ));
		fi
		try=$(( ($ub+$lb)/2 ));
		echo -e $ROSE"Solution found at : "$last_solution""$NORMAL
	done
	
}

local_timeout=30;
version=2;
instance=Instances/C101.txt;

while getopts "t:v:i:" opt; do
	case "$opt" in
    	t) local_timeout=$OPTARG ;;
		v) version=$OPTARG ;;
		i) instance=$OPTARG ;;
	esac
done
advertise $ROUGE"launching the program (v"$version") with "$local_timeout" for each try on instance "$instance""$NORMAL;

program=./VRPTW;
case "$version" in 
	1) program=VRPTW.co;;
	2) program=VRPTW_NVehicle.co;;
esac

search_values $local_timeout $program $instance;
