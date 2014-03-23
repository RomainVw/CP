#!/bin/bash

chaineZ=knapsack_instances/A/knapsack-A-

for i in $(seq 1 1 25);
do
    /Applications/Comet/comet -j2 knapsackUB.co -f$chaineZ$i.txt > UB-A-f$i.txt
done