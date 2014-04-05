#!/bin/bash

chaineX1=TimeTabling_Instances/competition0
chaineX2=TimeTabling_Instances/competition


for i in $(seq 1 1 4);
do
    echo "#$i&" >> result.txt
    /Applications/Comet/comet -j2 time_tabling.co -f$chaineX1$i.tim >> result.txt
done


for i in $(seq 6 1 9);
do
echo "#$i&" >> result.txt
/Applications/Comet/comet -j2 time_tabling.co -f$chaineX1$i.tim >> result.txt
done

for i in $(seq 10 1 15);
do
echo "#$i&" >> result.txt
/Applications/Comet/comet -j2 time_tabling.co -f$chaineX2$i.tim >> result.txt
done

for i in $(seq 17 1 20);
do
echo "#$i&" >> result.txt
/Applications/Comet/comet -j2 time_tabling.co -f$chaineX2$i.tim >> result.txt
done