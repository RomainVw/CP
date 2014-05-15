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

Latex=false;

function advertise() {
    echo -e $delimiter
    echo -e $1
    echo -e $delimiter
}

function wait_and_kill() {
    sleep $1
    kill $2 &>/dev/null
}

function search_values() {
	local_timeout=$1;
	instance=$2;
	lb=9;
	ub=25;
	try=$(( ($ub+$lb)/2 ));
	last_solution=25;
	number_of_fails=0;

	#compute number of routes
	while [ "$lb" -le "$ub" ]
	do
		try=$(( ($ub+$lb)/2 ));

		if [ "$Latex" = false ]
		then
			echo -e $ROSE"Trying with "$try" for "$local_timeout"s "$NORMAL
		fi

		/Applications/Comet/comet.app/Contents/MacOS/comet VRPTW_NVehicle.co Instances/$instance $try > output 2>/dev/null &
		
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
			if [ $found_solution -eq 0 ]
			then
				number_of_fails=$(( $number_of_fails + 1));
			fi
			lb=$(( $try + 1 ));
		fi
		try=$(( ($ub+$lb)/2 ));

		if [ "$Latex" = false ]
		then
			echo -e $ROSE"Solution found at : "$last_solution""$NORMAL 
			echo -e $ROSE"ub = "$ub", lb="$lb""$NORMAL 
		fi
	done
	
	time_left=$(( 120 - $number_of_fails*$local_timeout - 10));

	if [ "$Latex" = false ]
	then
		echo -e $ROUGE"Minimizing the number of routes for "$time_left"s"$NORMAL 
	fi
	/Applications/Comet/comet.app/Contents/MacOS/comet VRPTW_LRoute.co Instances/$instance $last_solution > output 2>/dev/null &
		
	pid=$!
	wait_and_kill $time_left $pid &
	wait $pid

	distance=$(awk '/./{line=$0} END{print $4}' output)

	if [ "$Latex" = false ]
	then
		advertise "Solution found with "$last_solution" vehicles for a distance of "$distance""$NORMAL
	else
		echo " "$instance" & "$last_solution" & "$distance" \\\\ "
	fi
	
	rm output
}

local_timeout=30;
instance=Instances/C101.txt;

while getopts "t:i:" opt; do
	case "$opt" in
    	t) local_timeout=$OPTARG ;;
		i) instance=$OPTARG ;;
	esac
done
advertise $ROUGE"launching the program with "$local_timeout"s for each try on instance "$instance""$NORMAL;


if [ "$Latex" = true ]
then
	echo "\begin{tabular}{ | c | c | c |}"
	echo "\hline"
	for f in $(ls Instances/); do
		search_values $local_timeout $f;
	done
	echo "\hline"
	echo "\end{tabular}"
else 
	search_values $local_timeout $instance;
fi
