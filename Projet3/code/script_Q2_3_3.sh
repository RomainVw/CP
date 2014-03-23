#!/bin/bash

chaineX=knapsack_instances/A/knapsack-A-

for i in $(seq 1 1 25);
do
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineX$i.txt >> LBUB/A/LBUB-A.txt
done

chaineY=knapsack_instances/B/knapsack-B-

for i in $(seq 1 1 25);
do
/Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineY$i.txt >> LBUB/B/LBUB-B.txt
done


chaineZ=knapsack_instances/C/knapsack-C-

for i in $(seq 1 1 25);
do
/Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineZ$i.txt >> LBUB/C/LBUB-C.txt
done